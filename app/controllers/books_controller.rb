# frozen_string_literal: true

class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def on_sale
    @books = Book.where("email is null or email = ''")
  end

  def is_new
    @books = Book.where("email is null or email = ''")
  end
end
