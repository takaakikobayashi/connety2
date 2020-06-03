class MessagesController < ApplicationController
  
  def create
    @message = Message.new(message_params)
    if message_params[:requester_id].nil?
      @message.user_id = message_params[:user_id].to_i
    else
      @message.requester_id = message_params[:requester_id].to_i
    end
    @message.room_id = message_params[:room_id].to_i
    @message.save
    if message_params[:requester_id].nil?
      redirect_to "/users/#{@message.user_id}/rooms/#{@message.room_id}"
    else
      redirect_to "/requesters/#{@message.requester_id}/rooms/#{@message.room_id}"
    end
  end

  private
  def message_params
    params.require(:message).permit(:mail,:room_id,:user_id,:requester_id)
  end
end
