class CreateSettingGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :setting_goals do |t|
      t.string :target
      t.text :concern
      t.text :commitment
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
