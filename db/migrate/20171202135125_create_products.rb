class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.integer :inventory_id
      t.string :title
      t.text :description
      t.decimal :price
      t.integer :available_quantity
      t.integer :brand_id

      t.timestamps
    end
  end
end
