class AddDeviceTokenUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :device_token, :string
    add_column :users, :user_type, :string
    add_column :users, :type, :string
  end
end
