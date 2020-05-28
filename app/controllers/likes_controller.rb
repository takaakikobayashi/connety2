class LikesController < ApplicationController
  def create
  	@like = current_user.like.new(scholastic_record_id: params[:scholastic_record_id])
  	@like.user_id = current_user.id
    if @like.save
    redirect_to request.referer
else
	render 'scholastic_record/index'
end

  end

  def destroy
  	@like = current_user.like.find_by(scholastic_record_id: params[:scholastic_record_id])
    if @like.destroy
    redirect_to request.referer
else
	render 'scholastic_record/index'
  end
end
end
