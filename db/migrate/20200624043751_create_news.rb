class CreateNews < ActiveRecord::Migration[5.2]
  def change
    create_table :news do |t|
      t.string :category
      t.text :content

      t.timestamps
    end
  end
end
