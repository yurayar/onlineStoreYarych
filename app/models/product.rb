class Product < ApplicationRecord
  has_many :cart_items
  has_and_belongs_to_many :categories
  belongs_to :brand
  has_and_belongs_to_many :images
  mount_uploader :product_image, ProductImageUploader

  STOCK_STATUSES = [[true, "In Stock"], [false, "Out of stock"]]

  def remove_images
    self.images.destroy
  end
end
