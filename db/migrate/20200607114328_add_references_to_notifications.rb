class AddReferencesToNotifications < ActiveRecord::Migration[5.2]
  def change
  	add_reference :notifications, :message, foreign_key: true
  	add_reference :notifications, :room, foreign_key: true
  end
end
