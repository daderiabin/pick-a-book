# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :pages
  get '/static/:permalink', to: 'pages#permalink', as: 'permalink'

  resources :books, only: %i[index show]
  resources :genres, only: %i[index show]

  root to: 'books#index'
end
