class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all
    @cart_item = current_cart.cart_items.new
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @products = @category.products.all

    if @products.exists?
      @products_max_price = @products.order(price: :desc).limit(1).take.price
    end
    @category_brands = []
    @products.each do |prod|
      if @category_brands.index(prod.brand).nil?
        @category_brands.push(prod.brand)
      end
    end
    @cart_item = current_cart.cart_items.new
  end

  def filter_products
    @category = Category.find(params[:category_id])
    @products = @category.products.all
    @cart_item = current_cart.cart_items.new

    @start_price = params[:start_price].to_f
    @end_price = params[:end_price].to_f
    @brands = params[:brand_ids]
    @sort_direction = params[:sort_direction]

    if @start_price and @end_price != 0
      @products = @category.products.where(price: @start_price..@end_price)
    end

    if @brands
      @products = @products.where(brand_id: params[:brand_ids])
    end

    if @sort_direction
      @products = @products.order("price #{@sort_direction}")
      puts @products
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find_by(slug: params[:id])
    end
end
