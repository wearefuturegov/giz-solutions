# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(*)
    if current_user.admin?
      :solutions
    elsif current_user.solution
      solution_path(current_user.solution)
    else
      :new_solution
    end
  end
end
