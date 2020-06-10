class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @tasks = Task.where(deadline: Date.today)
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

    # NOTE: ここから
    #%task_programing_today = ScholasticRecord.where(user_id: @user.id, category_id: 1, created_date: now).sum(:total_time)
    #%task_programing_1 = ScholasticRecord.where(user_id: @user.id, category_id: 1, created_date: now.yesterday).sum(:total_time)
    #%task_programing_2 = ScholasticRecord.where(user_id: @user.id, category_id: 1, created_date: now.ago(2.days)).sum(:total_time)
    #%task_programing_3 = ScholasticRecord.where(user_id: @user.id, category_id: 1, created_date: now.ago(3.days)).sum(:total_time)
    #%task_programing_4 = ScholasticRecord.where(user_id: @user.id, category_id: 1, created_date: now.ago(4.days)).sum(:total_time)
    #%task_programing_5 = ScholasticRecord.where(user_id: @user.id, category_id: 1, created_date: now.ago(5.days)).sum(:total_time)
    #%task_programing_6 = ScholasticRecord.where(user_id: @user.id, category_id: 1, created_date: now.ago(6.days)).sum(:total_time)


    #dates = ((now - 6.days)..now).map{|a|  [a,0]}.to_h
    #current_dated = ScholasticRecord.where(user_id: @user.id, category_id: 1, created_date: (now - 6.days)..now).group(:created_date).sum(:total_time)
    #task_programings = dates.merge(current_dated).values


    #task_movie_today = ScholasticRecord.where(user_id: @user.id, category_id: 2, created_date: now).sum(:total_time)
    #task_movie_1 = ScholasticRecord.where(user_id: @user.id, category_id: 2, created_date: now.yesterday).sum(:total_time)
    #task_movie_2 = ScholasticRecord.where(user_id: @user.id, category_id: 2, created_date: now.ago(2.days)).sum(:total_time)
    #task_movie_3 = ScholasticRecord.where(user_id: @user.id, category_id: 2, created_date: now.ago(3.days)).sum(:total_time)
    #task_movie_4 = ScholasticRecord.where(user_id: @user.id, category_id: 2, created_date: now.ago(4.days)).sum(:total_time)
    #task_movie_5 = ScholasticRecord.where(user_id: @user.id, category_id: 2, created_date: now.ago(5.days)).sum(:total_time)
    #task_movie_6 = ScholasticRecord.where(user_id: @user.id, category_id: 2, created_date: now.ago(6.days)).sum(:total_time)
    #task_design_today = ScholasticRecord.where(user_id: @user.id, category_id: 3, created_date: now).sum(:total_time)
    #task_design_1 = ScholasticRecord.where(user_id: @user.id, category_id: 3, created_date: now.yesterday).sum(:total_time)
    #task_design_2 = ScholasticRecord.where(user_id: @user.id, category_id: 3, created_date: now.ago(2.days)).sum(:total_time)
    #task_design_3 = ScholasticRecord.where(user_id: @user.id, category_id: 3, created_date: now.ago(3.days)).sum(:total_time)
    #task_design_4 = ScholasticRecord.where(user_id: @user.id, category_id: 3, created_date: now.ago(4.days)).sum(:total_time)
    #task_design_5 = ScholasticRecord.where(user_id: @user.id, category_id: 3, created_date: now.ago(5.days)).sum(:total_time)
    #task_design_6 = ScholasticRecord.where(user_id: @user.id, category_id: 3, created_date: now.ago(6.days)).sum(:total_time)    
    #task_marketing_today = ScholasticRecord.where(user_id: @user.id, category_id: 4, created_date: now).sum(:total_time)
    #task_marketing_1 = ScholasticRecord.where(user_id: @user.id, category_id: 4, created_date: now.yesterday).sum(:total_time)
    #task_marketing_2 = ScholasticRecord.where(user_id: @user.id, category_id: 4, created_date: now.ago(2.days)).sum(:total_time)
    #task_marketing_3 = ScholasticRecord.where(user_id: @user.id, category_id: 4, created_date: now.ago(3.days)).sum(:total_time)
    #task_marketing_4 = ScholasticRecord.where(user_id: @user.id, category_id: 4, created_date: now.ago(4.days)).sum(:total_time)
    #task_marketing_5 = ScholasticRecord.where(user_id: @user.id, category_id: 4, created_date: now.ago(5.days)).sum(:total_time)
    #task_marketing_6 = ScholasticRecord.where(user_id: @user.id, category_id: 4, created_date: now.ago(6.days)).sum(:total_time)    
    #task_other_today = ScholasticRecord.where(user_id: @user.id, category_id: 5, created_date: now).sum(:total_time)
    #task_other_1 = ScholasticRecord.where(user_id: @user.id, category_id: 5, created_date: now.yesterday).sum(:total_time)
    #task_other_2 = ScholasticRecord.where(user_id: @user.id, category_id: 5, created_date: now.ago(2.days)).sum(:total_time)
    #task_other_3 = ScholasticRecord.where(user_id: @user.id, category_id: 5, created_date: now.ago(3.days)).sum(:total_time)
    #task_other_4 = ScholasticRecord.where(user_id: @user.id, category_id: 5, created_date: now.ago(4.days)).sum(:total_time)
    #task_other_5 = ScholasticRecord.where(user_id: @user.id, category_id: 5, created_date: now.ago(5.days)).sum(:total_time)
    #task_other_6 = ScholasticRecord.where(user_id: @user.id, category_id: 5, created_date: now.ago(6.days)).sum(:total_time)    
  
    #gon.data_programing = [task_programing_6,task_programing_5,task_programing_4,task_programing_3,task_programing_2,task_programing_1,task_programing_today]
    #gon.data_movie = [task_movie_6,task_movie_5,task_movie_4,task_movie_3,task_movie_2,task_movie_1,task_movie_today]
    #gon.data_design = [task_design_6,task_design_5,task_design_4,task_design_3,task_design_2,task_design_1,task_design_today]
    #gon.data_marketing = [task_marketing_6,task_marketing_5,task_marketing_4,task_marketing_3,task_marketing_2,task_marketing_1,task_marketing_today]
    #gon.data_other = [task_other_6,task_other_5,task_other_4,task_other_3,task_other_2,task_other_1,task_other_today]
    # NOTE: ここまで不要

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
    # 7days => 0, 6days => 0, ...., 1days => 0
    dates = ((now - 6.days)..now).map{|a| [a,0]}.to_h
    # 5days => 3, 2days => 1
    current_dates = ScholasticRecord.where(user_id: @user.id, category_id: category_id, created_date: (now - 6.days)..now)
                                    .group(:created_date).sum(:total_time)
    # 7days => 0, 6days => 0, 5days => 3, 4days => 0, 3days => 0,  2days => 1, 1days => 0  
    # [0,0,3,0,0,1,0]                              
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
      :learning_status
    )
  end
end