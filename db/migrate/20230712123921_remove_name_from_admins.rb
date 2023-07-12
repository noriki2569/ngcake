class RemoveNameFromAdmins < ActiveRecord::Migration[6.1]
  def change
    remove_column :admins, :email, :string
    remove_column :admins, :encrypted_password, :string
  end
end
