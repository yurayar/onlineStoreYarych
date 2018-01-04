class AddCountryToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :delivery_country, :string
  end
end
