Rails.application.routes.draw do
  get 'welcome/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :product, only: [:index, :show]
  resources :pages, only: [:show]
  resources :categories, only: [:index, :show]

  get ':permalink', to: 'pages#permalink'
  get 'static_about', to: 'pages#about', as: 'about'
  get 'static_home', to: 'pages#home', as: 'home'

  # root to: 'product#index'
end
