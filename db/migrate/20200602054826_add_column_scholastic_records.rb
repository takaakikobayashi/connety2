class AddColumnScholasticRecords < ActiveRecord::Migration[5.2]
  def change
  	add_column :scholastic_records, :total_time, :integer
  end
end
