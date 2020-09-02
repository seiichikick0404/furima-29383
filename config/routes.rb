Rails.application.routes.draw do
  devise_for :users
  root to: 'tops#index'
  resources :tops, only: [:new, :create]
end
