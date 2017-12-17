class Customer::AccountController < Customer::BaseController

  def index
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end
end