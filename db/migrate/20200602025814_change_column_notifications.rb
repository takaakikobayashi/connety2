class ChangeColumnNotifications < ActiveRecord::Migration[5.2]
  def change
  	add_column :notifications, :action, :string, default: '', null: false
  end
end
