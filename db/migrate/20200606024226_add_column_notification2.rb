class AddColumnNotification2 < ActiveRecord::Migration[5.2]
  def change
  	add_reference :notifications, :requester_visitor, foreign_key: { to_table: :requesters }
  	add_reference :notifications, :requester_visited, foreign_key: { to_table: :requesters }
  	add_reference :notifications, :company_visitor, foreign_key: { to_table: :companies }
  	add_reference :notifications, :company_visited, foreign_key: { to_table: :companies }
  end
end
