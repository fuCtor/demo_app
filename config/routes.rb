Rails.application.routes.draw do
  get 'users/update'

  resources :commits, only: %i(index create)
  resources :users,   only: %i(update)
  root to: 'commits#index'
end
