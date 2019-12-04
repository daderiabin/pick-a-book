# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    get 'success', to: 'checkout#success', as: 'checkout_success'
  end

  # cart routes
  post 'books/add_to_cart/:id', to: 'books#add_to_cart', as: 'add_to_cart'
  post 'books/change_qnty/:id', to: 'books#change_qnty', as: 'change_qnty'
  delete 'books/remove_from_cart/:id', to: 'books#remove_from_cart', as: 'remove_from_cart'

  # pages routes
  resources :pages
  get '/static/:permalink', to: 'pages#permalink', as: 'permalink'

  # book routes
  resources :books, only: %i[index show]
  get '/on_sale', to: 'books#on_sale'
  get '/new_books', to: 'books#new_books'

  resources :genres, only: %i[index show]
  resources :book_formats, only: %i[index show]
  resources :orders, only: %i[index show]

  root to: 'books#index'
end
