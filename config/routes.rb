Rails.application.routes.draw do
  get 'home/index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :products

  devise_for :users

  resources :users

  root to: "products#index"

 end
