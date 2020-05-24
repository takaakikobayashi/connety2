class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :theme
      t.text :completion
      t.text :halfway
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
