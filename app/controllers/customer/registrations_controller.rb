class Customer::RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:customer).permit(:email, :password, :password_confirmation, :name, :surname, :city, :street, :house_number, :apartment_number)
  end

  def account_update_params
    params.require(:customer).permit(:email, :password, :password_confirmation, :name, :surname, :city, :street, :house_number, :apartment_number, :current_password)
  end

end
