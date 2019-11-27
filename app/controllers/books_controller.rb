# frozen_string_literal: true

class BooksController < ApplicationController
  include Pagy::Backend
  before_action :init_session
  before_action :load_cart

  def index
    @pagy, @books = pagy(Book.search(params[:search], params[:format]), page: params[:page], items: 6)
  end

  def show
    @book = Book.find(params[:id])
  end

  def add_to_cart
    id = params[:id].to_i
    qnty = 1
    session[:cart] << id unless session[:cart].include?(id)
    session[:qnty][id] = qnty unless session[:qnty].include?(id)
    redirect_to root_path
  end

  def remove_from_cart
    id = params[:id].to_i
    session[:cart].delete(id)
    session[:qnty].delete(id.to_s)
    redirect_to root_path
  end

  def change_qnty
    id = params[:id].to_i
    qnty = params[:qnty].to_i
    session[:qnty][id] = qnty
    redirect_to root_path
  end

  def on_sale
    @pagy, @books = pagy(Book.where('on_sale == 1'), page: params[:page], items: 6)
  end

  def new_books
    @pagy, @books = pagy(Book.where('is_new == 1'), page: params[:page], items: 6)
  end

  private

  def init_session
    session[:cart] ||= []
    session[:qnty] ||= {}
  end

  def load_cart
    @cart = Book.find(session[:cart])
    @qnty = session[:qnty]
  end
end
