class Product < ApplicationRecord
  has_many :cart_items
  has_and_belongs_to_many :categories
  belongs_to :brand
  mount_uploader :product_image, ProductImageUploader
end
