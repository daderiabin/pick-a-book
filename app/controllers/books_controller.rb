# frozen_string_literal: true

class BooksController < ApplicationController
  include Pagy::Backend

  def index
    @pagy, @books = pagy(Book.search(params[:search], params[:format]), page: params[:page], items: 6)
  end

  def show
    @book = Book.find(params[:id])
  end

  def on_sale
    # @books = Book.where('on_sale == 1')
    @pagy, @books = pagy(Book.where('on_sale == 1'), page: params[:page], items: 6)
  end

  def new_books
    # @books = Book.where('is_new == 1')
    @pagy, @books = pagy(Book.where('is_new == 1'), page: params[:page], items: 6)
  end
end
