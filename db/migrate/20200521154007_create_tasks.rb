class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.date :deadline
      t.boolean :progress_status, default: true, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
