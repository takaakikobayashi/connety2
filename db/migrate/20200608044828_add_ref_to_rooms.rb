class AddRefToRooms < ActiveRecord::Migration[5.2]
  def change
  	add_reference :rooms, :company, foreign_key: true
  end
end
