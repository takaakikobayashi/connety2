class Companies::ProblemSolutionsController < ApplicationController
	before_action :authenticate_company!
  def index
  	@problem_solutions = ProblemSolution.where(user_id: params[:user_id]).page(params[:page]).per(20)
  end

  private
  def problem_solution_params
    params.require(:problem_solutio).permit(:worked, :not_worked, :solution, :improvement_point)
  end
end
