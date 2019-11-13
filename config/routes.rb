# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :pages
  get '/static/:permalink', to: 'pages#permalink', as: 'permalink'

  resources :books, only: %i[index show]
  get '/on_sale', to: 'books#on_sale'
  get '/new_books', to: 'books#is_new'

  resources :genres, only: %i[index show]
  resources :book_formats, only: %i[index show]

  root to: 'books#index'
end
