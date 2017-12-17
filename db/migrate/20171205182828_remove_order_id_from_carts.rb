class RemoveOrderIdFromCarts < ActiveRecord::Migration[5.0]
  def change
    remove_reference :carts, :order
  end
end
