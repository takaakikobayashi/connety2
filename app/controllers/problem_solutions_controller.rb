class ProblemSolutionsController < ApplicationController
  def index
  	@problem_solutions = ProblemSolution.all.order(created_at: "DESC")
    @user = User.find(params[:user_id])
  end

  def new
  	@problem_solution = ProblemSolution.new
  end

  def create
  	@problem_solution = ProblemSolution.new(problem_solution_params)
  	@problem_solution.user_id = current_user.id
  	if @problem_solution.save
  		 redirect_to user_problem_solutions_path(current_user.id)
  	else
  		 render action: :new
  	end
  end

  private
  def problem_solution_params
    params.require(:problem_solution).permit(
      :worked,
      :not_worked,
      :solution,
      :improvement_point
    )
  end
end
