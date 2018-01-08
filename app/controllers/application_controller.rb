# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  expose :admin_logged_in, -> { current_user&.admin? }

  def authenticate_admin!
    not_authorised unless admin_logged_in
  end

  def not_authorised
    flash[:alert] = t('flash.errors.not_authorised')
    redirect_to '/'
  end

  def after_sign_in_path_for(*)
    if admin_logged_in
      :solutions
    elsif current_user.solution
      solution_path(current_user.solution)
    else
      :new_solution
    end
  end
end
