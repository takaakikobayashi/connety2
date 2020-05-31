class AddColumnNotifications < ActiveRecord::Migration[5.2]
  def change
  	add_column :notifications, :visitor_id, :integer
  	add_column :notifications, :visited_id, :integer
  end
end
