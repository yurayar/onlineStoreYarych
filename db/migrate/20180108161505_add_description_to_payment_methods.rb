class AddDescriptionToPaymentMethods < ActiveRecord::Migration[5.0]
  def change
    add_column :payment_methods, :description, :text
  end
end
