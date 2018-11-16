Rails.application.routes.draw do
  
  # devise for users
  # devise_for :users

  # our registration controller route
  devise_for :users, :controllers => { registrations: 'registrations' }
  
  # active admin
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  # products
  resources :product, only: [:index, :show] do
    member do
      post :add_products_to_cart
    end
    collection do
      post :clear_cart
    end
  end

  # categories
  resources :categories, only: [:index, :show]

  # static pages
  resources :pages, only: [:show]
  get ':permalink', to: 'pages#permalink'
  get 'static_about', to: 'pages#about', as: 'about'

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
