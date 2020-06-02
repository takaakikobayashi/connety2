class ChangeColumnScholasticRecords < ActiveRecord::Migration[5.2]
  def change
  	change_column :scholastic_records, :total_time, :float
  end
end
