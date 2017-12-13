# frozen_string_literal: true

class WinnersController < ApplicationController
  before_action :authenticate_admin!

  expose :solution

  def update
    solution.update_attributes(winner: !solution.winner)
    redirect_back(fallback_location: solution_path(solution))
  end
end
