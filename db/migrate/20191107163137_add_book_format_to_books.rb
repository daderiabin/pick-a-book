# frozen_string_literal: true

class AddBookFormatToBooks < ActiveRecord::Migration[6.0]
  def change
    add_reference :books, :book_format, foreign_key: true
  end
end
