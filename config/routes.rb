Rails.application.routes.draw do
  get 'welcome/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  # products
  resources :product, only: [:index, :show]
  # static pages
  resources :pages, only: [:show]
  # categories
  resources :categories, only: [:index, :show]
  # search
  resources :search, only: [:index] do
    collection do
      get 'results'
    end
  end

  get ':permalink', to: 'pages#permalink'
  get 'static_about', to: 'pages#about', as: 'about'

  root to: 'welcome#index'
end
