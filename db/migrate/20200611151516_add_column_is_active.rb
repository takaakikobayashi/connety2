class AddColumnIsActive < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :is_active, :boolean, default: true, null: false
  	add_column :requesters, :is_active, :boolean, default: true, null: false
  end
end
