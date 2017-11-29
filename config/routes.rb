# frozen_string_literal: true

GizSolutions::Application.routes.draw do
  devise_for :users
  root to: 'application#home'
end
