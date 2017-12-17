class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.decimal :subtotal
      t.decimal :delivery_price
      t.decimal :tax
      t.decimal :total
      t.string :delivery_city
      t.string :delivery_street
      t.string :delivery_house_number
      t.string :delivery_apartment_number
      t.references :payment_method, foreign_key: true
      t.references :shipping_method, foreign_key: true
      t.integer :tracking_number
      t.string :status

      t.timestamps
    end
  end
end
