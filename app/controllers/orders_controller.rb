class OrdersController < ApplicationController
  before_action :authenticate_customer!

  # GET /orders/new
  def new
    @order = Order.new
    @shipping_methods = ShippingMethod.all
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    session.delete(:cart_id)

    respond_to do |format|
      if @order.save
        format.html { redirect_to customer_order_path(@order), notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:subtotal, :delivery_price, :tax, :total, :delivery_country, :delivery_city, :delivery_street, :delivery_house_number, :delivery_apartment_number, :payment_method_id, :shipping_method_id, :tracking_number, :status, :cart_id, :customer_name, :customer_surname, :customer_phone, :customer_email, :customer_id)
    end
end
