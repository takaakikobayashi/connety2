class LikesController < ApplicationController
  def create
  	@like = current_user.likes.new(scholastic_record_id: params[:scholastic_record_id])
  	@like.user_id = current_user.id
    if @like.save
      scholastic_record = ScholasticRecord.find(params[:scholastic_record_id])
    scholastic_record.create_notification_like!(current_user)
    redirect_to request.referer
else
	render 'scholastic_record/index'
end

  end

  def destroy
  	@like = current_user.likes.find_by(scholastic_record_id: params[:scholastic_record_id])
    if @like.destroy
    redirect_to request.referer
else
	render 'scholastic_record/index'
  end
end
end
