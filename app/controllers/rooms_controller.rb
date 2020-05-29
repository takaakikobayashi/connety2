class RoomsController < ApplicationController
  def index
  end

  def show
  end

  def create
  	@room = Room.new(room_params)
    @room.user_id = params[:user_id].to_i
    @room.requester_id = current_requester.id
    @room.entry_id = Entry.find_by(user_id: params[:user_id],requester_id: current_requester.id,room_id: @room.id).id
    @room.save
      redirect_to room_path(@room.id)
  end

private
  def room_params
    params.require(:room).permit(:message)
  end
end
