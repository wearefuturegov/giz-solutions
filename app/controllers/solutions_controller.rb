# frozen_string_literal: true

class SolutionsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :authenticate_admin!, only: :destroy
  before_action :authenticate_can_edit!, only: %i[update edit]

  expose :solution
  expose :winning_solutions, -> { Solution.winners }
  expose :solutions, lambda {
    if ApplicationState.instance.announce_winners?
      Solution.where(winner: false)
    else
      Solution.all
    end
  }

  expose :deleted_solutions, lambda {
    Solution.only_deleted if admin_logged_in
  }

  expose :can_edit_solution, lambda {
    admin_logged_in || current_user&.solution == solution
  }

  def show; end

  def index; end

  def new; end

  def destroy
    solution.delete
    redirect_to :solutions
  end

  def create
    solution.user = current_user
    if solution.save
      SolutionMailer.notify_admins(
        User.admins.collect(&:email), solution
      ).deliver_now
      flash[:success] = 'Your solution has been created'
      redirect_to solution_path(solution)
    else
      render :new
    end
  end

  def edit; end

  def update
    if solution.update(solution_params)
      flash[:success] = 'Your changes have been saved'
      redirect_to solution_path(solution)
    else
      render :edit
    end
  end

  private

  def authenticate_can_edit!
    return if can_edit_solution
    not_authorised
  end

  def solution_params
    params.require(:solution).permit(
      :title,
      :terms_accepted,
      :description,
      :business_opportunities,
      :skills_experience,
      :implementation_impact,
      :embedded_video_url,
      :website,
      :hero_image
    )
  end
end
