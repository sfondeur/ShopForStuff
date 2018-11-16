Rails.application.routes.draw do
  
  # devise for users
  devise_for :users
  
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
  # static pages
  resources :pages, only: [:show]
  get ':permalink', to: 'pages#permalink'
  get 'static_about', to: 'pages#about', as: 'about'

  # categories
  resources :categories, only: [:index, :show]
  # search
  resources :search, only: [:index] do
    collection do
      get 'results'
    end
  end

  # welcome page
  resources :welcome, only: [:index]

  # root route to the welcome page
  root to: 'welcome#index'
end
