class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user
  before_action :active_user
  def index
  end

  def create
  	@scholastic_record = ScholasticRecord.find(params[:scholastic_record_id])
    @comment = current_user.comments.new(comment_params)
    @comment.scholastic_record_id = params[:scholastic_record_id].to_i
    if @comment.save
       @scholastic_record.create_notification_comment!(current_user, @scholastic_record.id)
       redirect_to user_scholastic_record_path(user_id: params[:user_id],id: params[:scholastic_record_id])
    else
	     render 'scholastic_record/show'
    end
  end

  def destroy
  	Comment.find_by(user_id: params[:user_id], scholastic_record_id: params[:scholastic_record_id], id: params[:id]).destroy
    redirect_to user_scholastic_record_path(user_id: params[:user_id],id: params[:scholastic_record_id])
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
