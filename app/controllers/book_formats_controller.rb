class BookFormatsController < ApplicationController
  def index
    @book_formats = BookFormat.all
  end

  def show
    @book_format = BookFormat.find(params[:id])
  end
end
