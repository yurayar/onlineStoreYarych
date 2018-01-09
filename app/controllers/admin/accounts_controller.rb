class Admin::AccountsController < Admin::BaseController
  before_action :set_account, only: [:destroy]
  def index
    @customers = Customer.all.order('id')
    @admins = Admin.all.order('id')
    @admin = Admin.new
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.create(sign_up_params)
    redirect_to admin_accounts_path
  end

  def destroy
    @admin.destroy
    redirect_to admin_accounts_path
  end

  private

  def set_account
    @admin = Admin.find(params[:id])
  end

  def sign_up_params
    params.require(:admin).permit(:email, :password, :password_confirmation, :name, :surname)
  end
end
