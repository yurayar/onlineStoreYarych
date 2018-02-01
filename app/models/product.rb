class Product < ApplicationRecord
  has_many :cart_items
  has_and_belongs_to_many :categories
  belongs_to :brand
  has_and_belongs_to_many :images
  mount_uploader :product_image, ProductImageUploader

  validates :categories, presence: true

  before_create :generate_inventory_id

  STOCK_STATUSES = [[true, "In Stock"], [false, "Out of stock"]]

  private

  def generate_inventory_id
    self.inventory_id = rand(1000000..10000000).to_i
  end
end
