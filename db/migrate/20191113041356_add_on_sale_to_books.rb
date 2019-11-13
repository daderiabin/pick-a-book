# frozen_string_literal: true

class AddOnSaleToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :on_sale, :boolean
  end
end
