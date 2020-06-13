class UsersController < ApplicationController
  before_action :authenticate
  before_action :correct_user, only: [:edit, :update, :delete, :destroy]
  before_action :active_user
  def index
    @users = User.all.page(params[:page]).per(20)
    total_min = ScholasticRecord.where(user_id: @user.id).sum(:learning_time_min).divmod(60)
    @total_h_time = ScholasticRecord.where(user_id: @user.id).sum(:learning_time) + total_min[0]
    @total_m_time = total_min[1]
  end

  def show
    @user = User.find(params[:id])
    if user_signed_in?
      @tasks = Task.where(deadline: Date.today, user_id: current_user.id)
    end
    @scholastic_records = ScholasticRecord.where(user_id: @user.id)
    now = Date.today
    @reviews = Review.find_by(created_at: now.yesterday)
    if user_signed_in? and current_user.id == @user.id
       @setting_goal = SettingGoal.find_by(user_id: current_user.id)
    end
    total_min = ScholasticRecord.where(user_id: @user.id).sum(:learning_time_min).divmod(60)
    @total_h_time = ScholasticRecord.where(user_id: @user.id).sum(:learning_time) + total_min[0]
    @total_m_time = total_min[1]

    dates = ((now - 6.days)..now).map { |a| [a] }
    gon.dates = dates

    gon.data_programing = calcurate_times(now, 1)
    gon.data_movie = calcurate_times(now, 2)
    gon.data_design = calcurate_times(now, 3)
    gon.data_marketing = calcurate_times(now, 4)
    gon.data_other = calcurate_times(now, 5)
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

  def calcurate_times(now, category_id)
    dates = ((now - 6.days)..now).map{|a| [a,0]}.to_h
    current_dates = ScholasticRecord.where(user_id: @user.id, category_id: category_id, created_date: (now - 6.days)..now)
                                    .group(:created_date).sum(:total_time)
    dates.merge(current_dates).values
  end

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
      :image
    )
  end
end