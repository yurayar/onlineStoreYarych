class CreateJoinTableProductsImages < ActiveRecord::Migration[5.0]
  def change
    create_join_table :products, :images do |t|
      # t.index [:product_id, :image_id]
      # t.index [:image_id, :product_id]
    end
  end
end
