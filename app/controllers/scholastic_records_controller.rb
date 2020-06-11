class ScholasticRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:new, :create]
  before_action :active_user
  def index
  	@categories = Category.all
    if params["category_id"].nil?
      @scholastic_records = ScholasticRecord.all.page(params[:page]).per(30)
    else
      @scholastic_records = ScholasticRecord.where(category_id: params["category_id"]).page(params[:page]).per(30)
    end
  	@user = User.find(params[:user_id])
  	@setting_goals = SettingGoal.all
  	@setting_goal = SettingGoal.find_by(user_id: current_user.id)
    @strengths = Strength.all
    now = Date.today
    @review = Review.find_by(created_at: now.yesterday)
    total_min = ScholasticRecord.where(user_id: @user.id).sum(:learning_time_min).divmod(60)
    @total_h_time = ScholasticRecord.where(user_id: @user.id).sum(:learning_time) + total_min[0]
    @total_m_time = total_min[1]
  end

  def show
  	@scholastic_record = ScholasticRecord.find(params[:id])
  	@comment = Comment.new
  end

  def new
  	@scholastic_record = ScholasticRecord.new
  end

  def create
  	@scholastic_record = ScholasticRecord.new(scholastic_record_params)
    @scholastic_record.total_time = scholastic_record_params[:learning_time].to_i + scholastic_record_params[:learning_time_min].to_f/60.round.to_i
  	@scholastic_record.user_id = current_user.id
  	@scholastic_record.category_id = scholastic_record_params[:category_id].to_i
  	if @scholastic_record.save
  		 redirect_to user_scholastic_records_path(current_user.id)
  	else
  		 render action: :new
  	end
  end

  private
  def scholastic_record_params
    params.require(:scholastic_record).permit(
      :category_id,
      :learning_content,
      :learning_detail,
      :learning_time,
      :learning_time_min,
      :total_time,
      :created_date
    )
  end
end
