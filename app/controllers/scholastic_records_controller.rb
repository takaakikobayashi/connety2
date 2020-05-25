class ScholasticRecordsController < ApplicationController
  def index
  	@categories = Category.all
  	@user = User.find(params[:user_id])
  	@setting_goals = SettingGoal.all
    @strengths = Strength.all
    @scholastic_records = ScholasticRecord.all
  end

  def new
  	@scholastic_record = ScholasticRecord.new
  end

  def create
  	@scholastic_record = ScholasticRecord.new(scholastic_record_params)
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
    params.require(:scholastic_record).permit(:category_id, :learning_content, :learning_detail, :learning_time, :learning_time_min)
  end
end
