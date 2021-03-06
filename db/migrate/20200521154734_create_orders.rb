class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :request_content, null: false
      t.text :request_detail, null: false
      t.integer :cost, null: false
      t.integer :progress_status, null: false, default: 0
      t.references :user, foreign_key: true
      t.references :requester, foreign_key: true
      t.integer :order_status, default: 0

      t.timestamps
    end
  end
end
