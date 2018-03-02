# frozen_string_literal: true

GizSolutions::Application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'pages#home'

  get 'terms', to: 'pages#terms'

  resources :restore_solutions, only: :update

  resources :solutions do
    resource :winners, only: :update
  end

  resource :application_state, only: %i[edit update]
end
