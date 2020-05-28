class Requesters::ProblemSolutionsController < ApplicationController
  def index
  	@problem_solutions = ProblemSolution.where(user_id: params[:user_id])
  end

  private
  def problem_solution_params
    params.require(:problem_solutio).permit(:worked, :not_worked, :solution, :improvement_point)
  end
end
