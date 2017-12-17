class Customer::DashboardController < Customer::BaseController

  def index
    @orders = current_customer.orders.all
  end
end