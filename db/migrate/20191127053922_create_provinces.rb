class CreateProvinces < ActiveRecord::Migration[6.0]
  def change
    create_table :provinces do |t|
      t.string :name
      t.float :hst
      t.float :gst
      t.float :pst

      t.timestamps
    end
  end
end
