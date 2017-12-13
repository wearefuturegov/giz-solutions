# frozen_string_literal: true

class SolutionsController < ApplicationController
  before_action :authenticate_user!, except: %i[show create]
  before_action :authenticate_admin!, only: :destroy
  before_action :authenticate_can_edit!, only: %i[update edit]

  expose :solution
  expose :new_solution, lambda {
    Solution.new(solution_params.merge!(user: current_user))
  }
  expose :solutions, -> { Solution.all }
  expose :deleted_solutions, lambda {
    Solution.only_deleted if admin_logged_in
  }

  def show; end

  def index; end

  def new; end

  def destroy
    solution.delete
    redirect_to :solutions
  end

  def create
    if new_solution.save
      SolutionMailer.notify_admins(
        User.admins.collect(&:email), new_solution
      ).deliver_now
      flash[:success] = 'Your solution has been created'
      redirect_to solution_path(new_solution)
    else
      render :new
    end
  end

  def edit; end

  def authenticate_can_edit!
    return if admin_logged_in
    return if current_user.solution == solution
    not_authorised
  end

  def update
    if solution.update(solution_params)
      flash[:success] = 'Your changes have been saved'
      redirect_to solution_path(solution)
    else
      render :edit
    end
  end

  def solution_params
    params.require(:solution).permit(
      :title,
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
