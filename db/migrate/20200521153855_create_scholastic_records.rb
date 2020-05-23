class CreateScholasticRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :scholastic_records do |t|
      t.integer :learning_time

      t.timestamps
    end
  end
end
