class RoomsController < ApplicationController
  def index
  end

  def show
  	@room = Room.find(params[:id])

          @message = Message.new
          @entries = @room.entries
          @rmember = Requester.find_by(@entries)
          @umember = User.find_by(@entries)
          @messages = Message.where(@entries)
  end

  def create
  	@room = Room.new
    @room.entry_id = params.require(:entry).permit(:user_id, :room_id).merge(:room_id => @room.id,:requester_id => current_requester.id)
    @room.save
    redirect_to room_path(@room.id)
  end

private
  def message_params
    params.require(:message).permit(:mail)
  end
end
