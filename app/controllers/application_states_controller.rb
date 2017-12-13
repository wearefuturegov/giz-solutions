# frozen_string_literal: true

class ApplicationStatesController < ApplicationController
  before_action :authenticate_admin!

  expose :winning_solutions, -> { Solution.winners }

  def edit
    render "edit_#{GizSolutions.config.application_state}_state"
  end

  def update
    GizSolutions.config.application_state = verified_new_state
    redirect_to :edit_application_state
  end

  private

  def verified_new_state
    new_state = ApplicationState.send(application_state_params[:state])
    return not_authorised unless new_state
    new_state
  end

  def application_state_params
    params.permit(:state)
  end
end
