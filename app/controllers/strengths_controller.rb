class StrengthsController < ApplicationController
  def new
  	@strength = Strength.new
  end

  def show
  	@strengths = Strength.where(current_user)
  end

  def edit
  	@strength = Strength.find(params[:id])
  end

  def create
  	@strength = Strength.new(strength_params)
  	@strength.user_id = current_user.id
  	if @strength.save
  		redirect_to user_strength_path(current_user.id)
  	else
  		render action: :new
  	end
  end

  def update
  	@strength = Strength.find(params[:id])
    if @strength.update(strength_params)
      redirect_to user_strength_path(current_user.id)
    else
      render action: :edit
    end
  end

  def destroy
  end

  private
  def strength_params
    params.require(:strength).permit(:skill, :expection, :apeal_point, :portfolio)
  end
end
