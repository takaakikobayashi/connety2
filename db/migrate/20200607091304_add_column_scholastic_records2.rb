class AddColumnScholasticRecords2 < ActiveRecord::Migration[5.2]
  def change
  	add_column :scholastic_records, :created_date, :date
  end
end
