class AddDetailsToAdmins < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :name, :string
    add_column :admins, :surname, :string
  end
end
