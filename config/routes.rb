# frozen_string_literal: true

GizSolutions::Application.routes.draw do
  default_url_options host: GizSolutions.config.hostname

  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'pages#home'

  resources :restore_solutions, only: :update

  resources :solutions do
    resource :winners, only: :update
  end

  namespace :admin do
    resource :export_solutions, only: :show
    resource :application_state, only: %i[edit update]
  end
end
