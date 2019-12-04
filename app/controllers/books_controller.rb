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
    session[:qnty][id] = qnty
    flash[:note] = 'An item was added to your cart!'
    session[:taxes] = {}
    redirect_to root_path
  end

  def remove_from_cart
    id = params[:id].to_i
    session[:cart].delete(id)
    session[:qnty].delete(id.to_s)
    flash[:note] = 'An item was removed from your cart!'
    session[:taxes] = {}
    redirect_to root_path
  end

  def change_qnty
    id = params[:id].to_i
    qnty = params[:qnty].to_i
    session[:qnty][id] = qnty
    # session[:taxes] = {}
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
    session[:taxes] = {}
  end

  def load_cart
    @total = 0
    @current_user = User.find(current_user.id) if current_user
    @cart = Book.find(session[:cart])
    @qnty = session[:qnty]

    @cart.each do |item|
      @total += (item.price.to_f * 100) * @qnty[item.id.to_s]
    end

    if current_user
      hst = @current_user.province.hst * @total
      gst = @current_user.province.gst * @total
      pst = @current_user.province.pst * @total
      session[:taxes] = {
        'HST' => hst.to_i,
        'GST' => gst.to_i,
        'PST' => pst.to_i
      }
    end
  end
end
