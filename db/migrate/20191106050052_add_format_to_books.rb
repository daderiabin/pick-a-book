# frozen_string_literal: true

class AddFormatToBooks < ActiveRecord::Migration[6.0]
  def change
    add_reference :books, :format, foreign_key: true
  end
end
