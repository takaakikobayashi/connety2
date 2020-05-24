class CreateStrengths < ActiveRecord::Migration[5.2]
  def change
    create_table :strengths do |t|
      t.text :skill
      t.text :appeal_point
      t.text :expection
      t.text :portfolio
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
