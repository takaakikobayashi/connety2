class Requesters::StrengthsController < ApplicationController
  def index
  	@categories = Category.all
  	@users = User.where(learning_status: true)
  end

  def show
  	@user = User.find(params[:user_id])
  	@strength = Strength.find(params[:id])
  end

  private
  def strength_params
    params.require(:strength).permit(:skill, :appeal_point, :expection, :portfolio, :is_active, :user_id)
  end
end
