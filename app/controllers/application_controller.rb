# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home
    Rails.logger.info 'Rooted to home in app ApplicationController'
  end
end
