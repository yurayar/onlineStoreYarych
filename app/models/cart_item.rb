class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  before_save :set_item_price

  def item_unit_price
    product.price
  end

  def item_total_price
    unit_price * quantity
  end

  def check_quantity
    if quantity == 0
      self.destroy
    end
  end

  private
  def set_item_price
    self[:unit_price] = item_unit_price
    self[:total_price] = quantity * self[:unit_price]
  end
end
