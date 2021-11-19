Rails.application.routes.draw do
  resources :categories
  resources :products
  devise_for :users
  resources :users
  resources :notifications
  root to: "home#index"
end
