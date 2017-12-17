class CreateJoinTableProductsCategories < ActiveRecord::Migration[5.0]
  def change
    create_join_table :products, :categories do |t|
      # t.index [:product_id, :category_id]
      # t.index [:category_id, :product_id]
    end
  end
end
