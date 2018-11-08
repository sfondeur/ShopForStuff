Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :product, only: [:index, :show]
  resources :pages, only: [:show]

  get ':permalink', to: 'pages#permalink'
  get 'static_about', to: 'pages#about', as: 'about'

  root to: 'product#index'
end
