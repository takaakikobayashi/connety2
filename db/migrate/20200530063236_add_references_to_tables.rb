class AddReferencesToTables < ActiveRecord::Migration[5.2]
  def change
  	add_reference :users, :offer, foreign_key: true
  	add_reference :scholastic_records, :category, foreign_key: true
  	add_reference :notifications, :comment, foreign_key: true
  end
end
