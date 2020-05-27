class Requesters::ProblemSolutionsController < ApplicationController
  def index
  	@problem_solutions = ProblemSolution.where(user_id: params[:user_id])
  end
end
