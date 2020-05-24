class CreateScholasticRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :scholastic_records do |t|
      t.integer :learning_time
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end
