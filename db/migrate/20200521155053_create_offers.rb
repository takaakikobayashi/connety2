class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.string :industry, null: false
      t.string :occupation, null: false
      t.string :work_location, null: false
      t.text :appeal_point, null: false
      t.text :job_description, null: false
      t.string :employment_status, null: false
      t.integer :working_hour, null: false
      t.integer :salary, null: false
      t.text :application_condition, null: false
      t.text :vacation, null: false
      t.text :welfare, null: false
      t.boolean :is_active, default: true, null: false
      t.string :image_id
      t.references :user, foreign_key: true
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
