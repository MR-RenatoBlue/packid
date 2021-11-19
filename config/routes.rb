Rails.application.routes.draw do
  resources :categories
  resources :products
  devise_for :users
  resources :users
  resource :notifications, only: [:index]
  root to: "home#index"
end
