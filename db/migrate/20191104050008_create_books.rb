class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :year
      t.float :price

      t.timestamps
    end
  end
end
