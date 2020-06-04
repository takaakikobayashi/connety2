class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @tasks = Task.where(deadline: Date.today)
    @scholastic_record = ScholasticRecord.find(@user.id)
    @scholastic_record_data = ScholasticRecord.where(user_id: current_user.id).group_by_day_of_week(:created_at, format: "%a").sum(:total_time)
  
    gon.lavels = ["06/01", "06/02", "06/03", "06/04", "06/05", "06/06", "06/07"]
    gon.lavel = 'プログラミング'
    gon.data = [3, 3, 3, 3, 3, 3, 3]
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
    @user = User.find(params[:id])
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