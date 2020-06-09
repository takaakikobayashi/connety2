class AddColumnProblemSolutions < ActiveRecord::Migration[5.2]
  def change
  	add_column :problem_solutions, :cause, :text
  end
end
