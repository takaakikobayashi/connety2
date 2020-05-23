class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.string :action
      t.boolean :checked

      t.timestamps
    end
  end
end
