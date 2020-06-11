class Companies::StrengthsController < ApplicationController
  before_action :authenticate_company!
  def index
  	@categories = Category.all
  	@users = User.where(learning_status: true).page(params[:page]).per(20)
  end

  def show
  	@user = User.find(params[:user_id])
  	@strength = Strength.find_by(user_id: @user.id)
  end

  private
  def strength_params
    params.require(:strength).permit(:skill, :appeal_point, :expection, :portfolio, :is_active, :user_id)
  end
end
