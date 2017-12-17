class AddDetailsToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :customer_name, :string
    add_column :orders, :customer_surname, :string
    add_column :orders, :customer_phone, :string
    add_column :orders, :customer_email, :string
  end
end
