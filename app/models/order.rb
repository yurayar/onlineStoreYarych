class Order < ApplicationRecord
  belongs_to :payment_method
  belongs_to :shipping_method
  belongs_to :cart
  belongs_to :customer
  before_save :set_subtotal
  before_create :set_order_status

  ORDER_STATUSES = ["Processing", "Completed", "Cancelled"]

  def set_status(status)
    self.update_attributes(:status => status)
  end

  private
  def set_subtotal
    self[:subtotal] = self.cart.subtotal
    self[:delivery_price] = self.shipping_method.cost
    self[:total] = self.cart.subtotal + self.shipping_method.cost
  end

  def set_order_status
    self[:status] = ORDER_STATUSES.first
  end
end
