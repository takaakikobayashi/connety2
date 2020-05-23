class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :theme
      t.text :completion
      t.text :halfway

      t.timestamps
    end
  end
end
