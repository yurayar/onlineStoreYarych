class Customer::OrdersController < Customer::BaseController
  before_action :set_order, only: [:show]

  # GET /orders
  # GET /orders.json
  def index
    @customer = current_customer
    @orders = current_customer.orders.all.order(created_at: :desc)
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @customer = current_customer
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

end