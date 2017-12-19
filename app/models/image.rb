class Image < ApplicationRecord
  has_and_belongs_to_many :products
  mount_uploader :src, ProductImageUploader
end
