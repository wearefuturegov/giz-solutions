# frozen_string_literal: true

class Admin::ApplicationStatesController < ApplicationController
  before_action :authenticate_admin!

  expose :winning_solutions, -> { Solution.winners }

  def edit
    render "edit_#{ApplicationState.instance.state}_state"
  end

  def update
    ApplicationState.instance.update(
      state: application_state_params[:state].to_i
    )
    redirect_to :edit_admin_application_state
  end

  private

  def application_state_params
    params.permit(:state)
  end
end
