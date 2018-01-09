module Accessible

  extend ActiveSupport::Concern
  included(nil) do
    before_action :check_user_type
  end

  protected

  def check_user_type
    if current_admin
      flash.clear
      redirect_to(admin_root_path) && return
    elsif current_customer
      flash.clear
      redirect_to(customer_root_path) && return
    end
  end
end