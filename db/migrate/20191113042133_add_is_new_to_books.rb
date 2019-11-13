class AddIsNewToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :is_new, :boolean
  end
end
