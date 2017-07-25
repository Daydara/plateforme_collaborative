Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :products

  devise_for :users

  resources :users

  root to: "products#index"

 end
