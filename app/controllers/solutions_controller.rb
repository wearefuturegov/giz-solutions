# frozen_string_literal: true

class SolutionsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :authenticate_admin!, only: :destroy
  before_action :authenticate_can_edit!, only: %i[update edit]

  before_action :authenticate_can_show_archived!, only: %i[show]
  before_action :set_cache_headers, only: %i[new]
  
  expose :solution, scope: :with_deleted

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
    ApplicationState.instance.collection? &&
      (admin_logged_in || current_user&.solution == solution)
  }

  expose :solution_navigator, lambda {
    SolutionNavigator.new(Solution.with_deleted.pluck(:id), params[:id].to_i)
  }

  def show;  end

  def index; end

  def new
    if current_user.solution.nil?
      render :new
    else
      redirect_to edit_solution_path(current_user.solution)
    end
  end

  def destroy
    if solution.delete
      flash[:success] = 'The solution has been archived and no longer viewable by the public'
    else
      flash[:error] = "We're sorry, but something went wrong."
    end
    redirect_to solution_path(solution)
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
  
  def set_cache_headers
    response.headers['Cache-Control'] = 'no-cache, no-store'
    response.headers['Pragma'] = 'no-cache'
    response.headers['Expires'] = 'Fri, 01 Jan 1990 00:00:00 GMT'
  end

  def authenticate_can_show_archived!
    return unless solution.deleted?
    return if admin_logged_in
    not_authorised
  end

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
