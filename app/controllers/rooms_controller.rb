class RoomsController < ApplicationController
  def index
  end

  def show
  	@room = Room.find(params[:id])
  	@user = User.find(@room.user_id)
  	@requester = Requester.find(@room.requester_id)
    @message = Message.new
    @messages = Message.where(user_id: @room.user_id,requester_id: @room.requester_id)
    @user_messages = Message.where(user_id: @room.user_id)
    @requester_messages = Message.where(requester_id: @room.requester_id)
  end

  def create
  	@user = User.new
  	@room = Room.new(user_id: params[:user_id],requester_id: current_requester.id)
    @room.save
    redirect_to room_path(@room.id)
  end

  private
  def user_params
    params.require(:user).permit(:user_id)
  end
end
