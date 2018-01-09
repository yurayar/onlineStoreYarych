class CartsController < ApplicationController
  before_action :set_cart, only: [:show]

  # GET /carts
  # GET /carts.json
  def index
    @cart = current_cart
    @cart_items = current_cart.cart_items.order(id: :desc)
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.require(:cart).permit(:total)
    end
end
