class MessagesController < ApplicationController
  
  def create
    @message = Message.new(message_params)
    @message.user_id = message_params[:user_id].to_i
    @message.requester_id = message_params[:requester_id].to_i
    @message.room_id = message_params[:room_id].to_i
    @message.save
    redirect_to "/rooms/#{@message.room_id}"
  end

  private
  def message_params
    params.require(:message).permit(:mail,:room_id,:user_id,:requester_id)
  end
end
