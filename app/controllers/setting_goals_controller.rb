class SettingGoalsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:new, :create, :edit,:update]
  before_action :active_user
  def new
  	@setting_goal = SettingGoal.new
  end

  def show
  	@setting_goal = SettingGoal.find_by(user_id: current_user.id)
  end

  def create
  	@setting_goal = SettingGoal.new(setting_goal_params)
  	@setting_goal.user_id = current_user.id
  	if @setting_goal.save
  		 redirect_to user_setting_goals_show_path(user_id: current_user.id)
  	else
  		 render action: :new
  	end
  end

  def edit
  	@setting_goal = SettingGoal.find(params[:id])
  end

  def update
  	@setting_goal = SettingGoal.find(params[:id])
    if @setting_goal.update(setting_goal_params)
       redirect_to user_setting_goals_show_path(user_id: current_user.id)
    else
       render action: :edit
    end
  end

  private
  def setting_goal_params
    params.require(:setting_goal).permit(
      :target,
      :concern,
      :commitment
    )
  end
end
