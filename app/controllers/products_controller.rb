class ProductsController < ApplicationController
  before_action :set_product, only: [:show]

  helper_method :sort_direction

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    @cart_item = current_cart.cart_items.new
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @cart_item = current_cart.cart_items.new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end
end
