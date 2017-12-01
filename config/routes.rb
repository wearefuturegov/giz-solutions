# frozen_string_literal: true

GizSolutions::Application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'pages#home'

  resources :solutions
end
