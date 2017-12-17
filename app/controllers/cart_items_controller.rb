class CartItemsController < ApplicationController
  def create
    @cart = current_cart
    @cart_item =  @cart.cart_items.find_by product_id: cart_item_params[:product_id]
    if @cart_item
      @cart_item.quantity += 1
      @cart_item.save
    else
      @cart_item = @cart.cart_items.new(cart_item_params)
      @cart.save
    end
    session[:cart_id] = @cart.id
    @cart_items = @cart.cart_items.order(id: :desc)
  end

  def update
    @cart = current_cart
    @cart_item = @cart.cart_items.find(params[:id])
    if cart_item_params[:quantity].to_i == 0
      @cart_item.destroy
    else
      @cart_item = @cart_item.update(cart_item_params)
    end
    @cart_items = @cart.cart_items.order(id: :desc)
  end

  def destroy
    @cart = current_cart
    @cart_item = @cart.cart_items.find(params[:id])
    @cart_item.destroy
    @cart_items = @cart.cart_items.order(id: :desc)
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:quantity, :product_id)
  end
end
