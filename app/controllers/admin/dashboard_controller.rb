class Admin::DashboardController < Admin::BaseController
  def index
    @products = Product.all
  end
end