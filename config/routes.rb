Rails.application.routes.draw do
  resources :commits, only: %i(index create update)
  root to: 'commits#index'
end
