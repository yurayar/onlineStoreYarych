class Order < ApplicationRecord
  belongs_to :payment_method
  belongs_to :shipping_method
  belongs_to :cart
  belongs_to :customer
  before_save :set_subtotal

  private
  def set_subtotal
    self[:subtotal] = self.cart.subtotal
    self[:total] = self.cart.subtotal
   end
end
