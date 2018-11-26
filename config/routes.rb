# frozen_string_literal: true

Rails.application.routes.draw do
  # devise for users
  # devise_for :users

  # our registration controller route
  devise_for :users, controllers: { registrations: 'registrations' }

  # active admin
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # products
  resources :product, only: %i[index show] do
    member do
      post :add_to_cart
    end
    collection do
      post :clear_cart
    end
  end

  get 'products/(:filter)', to: 'product#index', as: 'products'

  # categories
  resources :categories, only: %i[index show]

  # resources :carts, only: [:index]
  get 'cart', to: 'carts#index'

  # static pages
  resources :pages, only: [:show]
  get ':permalink', to: 'pages#permalink'

  # search
  resources :search, only: [:index] do
    collection do
      get 'results'
    end
  end

  # welcome page
  resources :welcome, only: [:index]
  # get 'welcome', to: 'welcome#index'
  # root route to the welcome page
  root to: 'welcome#index' 
end
