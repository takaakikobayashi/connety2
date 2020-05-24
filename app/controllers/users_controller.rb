class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @tasks = Task.where(deadline: Date.today)
    @setting_goals = SettingGoal.all
    @strengths = Strength.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end

  def delete
    @user = User.find(params[:id])
  end

  def destroy
  end

private
  def user_params
    params.require(:user).permit(
      :last_name,
      :first_name,
      :user_name,
      :grade,
      :other_grade,
      :email,
      :phone_number, 
      :learning_status,
    )
  end

end