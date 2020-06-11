class StrengthsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:new, :edit, :create, :update, :release, :destroy]
  def new
  	@strength = Strength.new
  end

  def show
  	@strengths = Strength.find_by(user_id: current_user.id)
  end

  def edit
  	@strength = Strength.find(params[:id])
  end

  def create
  	@strength = Strength.new(strength_params)
  	@strength.user_id = current_user.id
  	if  @strength.save
  		redirect_to user_strengths_show_path(user_id: current_user.id)
  	else
  		render action: :new
  	end
  end

  def update
  	@strength = Strength.find(params[:id])
    if @strength.update(strength_params)
       redirect_to user_strengths_show_path(user_id: current_user.id)
    else
       render action: :edit
    end
  end

  def destroy
  	current_user.update(learning_status: false)
    redirect_to user_strengths_show_path(current_user.id)
  end

  def release
  	current_user.update(learning_status: true)
    redirect_to user_strengths_show_path(current_user.id)
  end

  private
  def strength_params
    params.require(:strength).permit(
      :skill,
      :expection,
      :appeal_point,
      :portfolio
    )
  end
end
