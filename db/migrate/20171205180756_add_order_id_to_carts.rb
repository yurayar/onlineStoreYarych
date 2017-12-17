class AddOrderIdToCarts < ActiveRecord::Migration[5.0]
  def change
    add_reference :carts, :order, foreign_key: true
  end
end
