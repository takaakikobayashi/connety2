class Requesters::ProblemSolutionsController < ApplicationController
	before_action :authenticate_requester!
	before_action :active_requester
  def index
  	@problem_solutions = ProblemSolution.where(user_id: params[:user_id]).page(params[:page]).per(20)
  end

  private
  def problem_solution_params
    params.require(:problem_solutio).permit(:worked, :not_worked, :solution, :improvement_point, :cause)
  end
end
