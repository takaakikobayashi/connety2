class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :mail
      t.references :user, foreign_key: true
      t.references :requester, foreign_key: true
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
