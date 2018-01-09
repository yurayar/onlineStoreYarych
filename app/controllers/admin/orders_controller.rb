class Admin::OrdersController < Admin::BaseController
  before_action :set_order, only: [:show, :edit, :update, :update_status, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/1/edit
  def edit
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to admin_order_path(@order), notice: 'Order was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def update_status
    @order.set_status(params[:order][:status])
    if @order.save
      redirect_to admin_order_path(@order)
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to admin_orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:subtotal, :delivery_price, :tax, :total, :delivery_country, :delivery_city, :delivery_street, :delivery_house_number, :delivery_apartment_number, :payment_method_id, :shipping_method_id, :tracking_number, :status, :cart_id)
    end
end
