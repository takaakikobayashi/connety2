class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @tasks = Task.where(deadline: Date.today)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def delete
    @user = User.find(params[:user_id])
  end

  def destroy
    @user = User.find(current_user.id)
    @user.destroy
    redirect_to root_path
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
      :learning_status
    )
  end

end