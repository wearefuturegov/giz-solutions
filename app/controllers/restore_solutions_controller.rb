# frozen_string_literal: true

class RestoreSolutionsController < ApplicationController
  before_action :authenticate_admin!

  expose :solution, scope: :with_deleted

  def update
    if solution.restore!
      flash[:success] = 'The solution has been restored and published again'
    else
      flash[:error] = "We're sorry, but something went wrong."
    end
    redirect_to solution_path(solution)
  end
end
