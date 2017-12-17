class Cart < ApplicationRecord
  has_many :cart_items
  has_one :order

  def subtotal
    cart_items.collect { |item| item.valid? ? (item.quantity * item.unit_price) : 0 }.sum
  end
end
