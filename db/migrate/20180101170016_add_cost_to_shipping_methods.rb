class AddCostToShippingMethods < ActiveRecord::Migration[5.0]
  def change
    add_column :shipping_methods, :cost, :decimal
  end
end
