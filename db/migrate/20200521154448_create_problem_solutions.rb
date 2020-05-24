class CreateProblemSolutions < ActiveRecord::Migration[5.2]
  def change
    create_table :problem_solutions do |t|
      t.text :worked
      t.text :not_worked
      t.text :solution
      t.text :improvement_point
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
