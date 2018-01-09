class Customer::RegistrationsController < Devise::RegistrationsController
  before_action :sign_up_params, only: [:create]
  before_action :account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  #def update
  #   super
  #end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  protected

  def after_update_path_for(resource)
    customer_account_index_path
  end

  private

  def sign_up_params
    params.require(:customer).permit(:email, :password, :password_confirmation, :name, :surname, :phone_number, :country, :city, :street, :house_number, :apartment_number)
  end

  def account_update_params
    params.require(:customer).permit(:email, :password, :password_confirmation, :name, :surname, :phone_number, :country, :city, :street, :house_number, :apartment_number, :current_password)
  end
end
