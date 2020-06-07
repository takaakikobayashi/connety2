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
    @setting_goal = SettingGoal.find(1)
    total_min = ScholasticRecord.where(user_id: @user.id).sum(:learning_time_min).divmod(60)
    @total_h_time = ScholasticRecord.where(user_id: @user.id).sum(:learning_time) + total_min[0]
    @total_m_time = total_min[1]

    task_programing_today = ScholasticRecord.where(user_id: @user.id, category_id: 1, created_date: now).sum(:total_time)
    task_programing_1 = ScholasticRecord.where(user_id: @user.id, category_id: 1, created_date: now.yesterday).sum(:total_time)
    task_programing_2 = ScholasticRecord.where(user_id: @user.id, category_id: 1, created_date: now.ago(2.days)).sum(:total_time)
    task_programing_3 = ScholasticRecord.where(user_id: @user.id, category_id: 1, created_date: now.ago(3.days)).sum(:total_time)
    task_programing_4 = ScholasticRecord.where(user_id: @user.id, category_id: 1, created_date: now.ago(4.days)).sum(:total_time)
    task_programing_5 = ScholasticRecord.where(user_id: @user.id, category_id: 1, created_date: now.ago(5.days)).sum(:total_time)
    task_programing_6 = ScholasticRecord.where(user_id: @user.id, category_id: 1, created_date: now.ago(6.days)).sum(:total_time)
    task_movie_today = ScholasticRecord.where(user_id: @user.id, category_id: 2, created_date: now).sum(:total_time)
    task_movie_1 = ScholasticRecord.where(user_id: @user.id, category_id: 2, created_date: now.yesterday).sum(:total_time)
    task_movie_2 = ScholasticRecord.where(user_id: @user.id, category_id: 2, created_date: now.ago(2.days)).sum(:total_time)
    task_movie_3 = ScholasticRecord.where(user_id: @user.id, category_id: 2, created_date: now.ago(3.days)).sum(:total_time)
    task_movie_4 = ScholasticRecord.where(user_id: @user.id, category_id: 2, created_date: now.ago(4.days)).sum(:total_time)
    task_movie_5 = ScholasticRecord.where(user_id: @user.id, category_id: 2, created_date: now.ago(5.days)).sum(:total_time)
    task_movie_6 = ScholasticRecord.where(user_id: @user.id, category_id: 2, created_date: now.ago(6.days)).sum(:total_time)
    task_design_today = ScholasticRecord.where(user_id: @user.id, category_id: 3, created_date: now).sum(:total_time)
    task_design_1 = ScholasticRecord.where(user_id: @user.id, category_id: 3, created_date: now.yesterday).sum(:total_time)
    task_design_2 = ScholasticRecord.where(user_id: @user.id, category_id: 3, created_date: now.ago(2.days)).sum(:total_time)
    task_design_3 = ScholasticRecord.where(user_id: @user.id, category_id: 3, created_date: now.ago(3.days)).sum(:total_time)
    task_design_4 = ScholasticRecord.where(user_id: @user.id, category_id: 3, created_date: now.ago(4.days)).sum(:total_time)
    task_design_5 = ScholasticRecord.where(user_id: @user.id, category_id: 3, created_date: now.ago(5.days)).sum(:total_time)
    task_design_6 = ScholasticRecord.where(user_id: @user.id, category_id: 3, created_date: now.ago(6.days)).sum(:total_time)    
    task_marketing_today = ScholasticRecord.where(user_id: @user.id, category_id: 4, created_date: now).sum(:total_time)
    task_marketing_1 = ScholasticRecord.where(user_id: @user.id, category_id: 4, created_date: now.yesterday).sum(:total_time)
    task_marketing_2 = ScholasticRecord.where(user_id: @user.id, category_id: 4, created_date: now.ago(2.days)).sum(:total_time)
    task_marketing_3 = ScholasticRecord.where(user_id: @user.id, category_id: 4, created_date: now.ago(3.days)).sum(:total_time)
    task_marketing_4 = ScholasticRecord.where(user_id: @user.id, category_id: 4, created_date: now.ago(4.days)).sum(:total_time)
    task_marketing_5 = ScholasticRecord.where(user_id: @user.id, category_id: 4, created_date: now.ago(5.days)).sum(:total_time)
    task_marketing_6 = ScholasticRecord.where(user_id: @user.id, category_id: 4, created_date: now.ago(6.days)).sum(:total_time)    
    task_other_today = ScholasticRecord.where(user_id: @user.id, category_id: 5, created_date: now).sum(:total_time)
    task_other_1 = ScholasticRecord.where(user_id: @user.id, category_id: 5, created_date: now.yesterday).sum(:total_time)
    task_other_2 = ScholasticRecord.where(user_id: @user.id, category_id: 5, created_date: now.ago(2.days)).sum(:total_time)
    task_other_3 = ScholasticRecord.where(user_id: @user.id, category_id: 5, created_date: now.ago(3.days)).sum(:total_time)
    task_other_4 = ScholasticRecord.where(user_id: @user.id, category_id: 5, created_date: now.ago(4.days)).sum(:total_time)
    task_other_5 = ScholasticRecord.where(user_id: @user.id, category_id: 5, created_date: now.ago(5.days)).sum(:total_time)
    task_other_6 = ScholasticRecord.where(user_id: @user.id, category_id: 5, created_date: now.ago(6.days)).sum(:total_time)    
  
    gon.data_programing = [task_programing_6,task_programing_5,task_programing_4,task_programing_3,task_programing_2,task_programing_1,task_programing_today]
    gon.data_movie = [task_movie_6,task_movie_5,task_movie_4,task_movie_3,task_movie_2,task_movie_1,task_movie_today]
    gon.data_design = [task_design_6,task_design_5,task_design_4,task_design_3,task_design_2,task_design_1,task_design_today]
    gon.data_marketing = [task_marketing_6,task_marketing_5,task_marketing_4,task_marketing_3,task_marketing_2,task_marketing_1,task_marketing_today]
    gon.data_other = [task_other_6,task_other_5,task_other_4,task_other_3,task_other_2,task_other_1,task_other_today]

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