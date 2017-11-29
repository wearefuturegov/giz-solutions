# frozen_string_literal: true

class SolutionsController < ApplicationController
  expose :solution
  expose :new_solution, lambda {
    Solution.new(solution_params.merge!(user: current_user))
  }
  expose :solutions, -> { Solution.all }

  def new; end

  def create
    if new_solution.save
      flash[:success] = 'solution saved'
      redirect_to solution_path(new_solution)
    else
      render :new
    end
  end

  def edit; end

  def update; end

  def index; end

  def solution_params
    params.require(:solution).permit(
      :title,
      :description,
      :business_opportunities,
      :skills_experience,
      :implementation_impact,
      :video_url,
      :website
    )
  end
end
