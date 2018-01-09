class BrandsController < ApplicationController
  before_action :set_brand, only: [:show, :edit, :update, :destroy]

  # GET /brands
  # GET /brands.json
  def index
    @brands = Brand.all
    @cart_item = current_cart.cart_items.new
  end

  # GET /brands/1
  # GET /brands/1.json
  def show
    @products = @brand.products.all

    if @products.exists?
      @products_max_price = @products.order(price: :desc).limit(1).take.price
    end
    @cart_item = current_cart.cart_items.new
  end

  def filter_products
    @brand = Brand.find(params[:brand_id])
    @products = @brand.products.all
    @cart_item = current_cart.cart_items.new

    @start_price = params[:start_price].to_f
    @end_price = params[:end_price].to_f
    @sort_direction = params[:sort_direction]

    if @start_price and @end_price != 0
      @products = @products.where(price: @start_price..@end_price)
    end

    if @sort_direction
      @products = @products.order("price #{@sort_direction}")
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brand
      @brand = Brand.find(params[:id])
    end
end
