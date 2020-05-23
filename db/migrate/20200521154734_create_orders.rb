class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :request_content, null: false
      t.text :request_detail, null: false
      t.integer :cost, null: false
      t.integer :progress_status, null: false

      t.timestamps
    end
  end
end
