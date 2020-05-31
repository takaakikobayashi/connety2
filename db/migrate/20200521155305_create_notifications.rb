class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.string :action
      t.boolean :checked, default: false, null: false
      t.references :user, foreign_key: true
      t.references :requester, foreign_key: true
      t.references :company, foreign_key: true
      t.references :scholastic_record, foreign_key: true
      #t.references :comment, foreign_key: true

      t.timestamps
    end
  end
end
