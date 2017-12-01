# frozen_string_literal: true

class SolutionsController < ApplicationController
  expose :solution
  expose :new_solution, lambda {
    Solution.new(solution_params.merge!(user: current_user))
  }
  expose :solutions, -> { Solution.all }

  def show; end

  def index; end

  def new; end

  def create
    if new_solution.save
      flash[:success] = 'Your solution has been created'
      redirect_to solution_path(new_solution)
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

  def solution_params
    params.require(:solution).permit(
      :title,
      :description,
      :business_opportunities,
      :skills_experience,
      :implementation_impact,
      :embedded_video_url,
      :website
    )
  end
end
