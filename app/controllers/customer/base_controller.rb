class Customer::BaseController < ApplicationController
  before_action :authenticate_customer!

  def dashboard
    @products = Product.all
  end
end
