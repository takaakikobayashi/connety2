class CreateScholasticRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :scholastic_records do |t|
      t.integer :learning_time
      t.integer :learning_time_min
      t.references :user, foreign_key: true
      #t.references :category, foreign_key: true
      t.string :learning_content
      t.text :learning_detail

      t.timestamps
    end
  end
end
