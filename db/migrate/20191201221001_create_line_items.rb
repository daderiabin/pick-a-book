class CreateLineItems < ActiveRecord::Migration[6.0]
  def change
    create_table :line_items do |t|
      t.references :book, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.string :title
      t.integer :quantity
      t.float :price

      t.timestamps
    end
  end
end
