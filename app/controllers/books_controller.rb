# frozen_string_literal: true

class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def on_sale
    @books = Book.where('on_sale == 1')
  end

  def new_books
    @books = Book.where('is_new == 1')
  end
end
