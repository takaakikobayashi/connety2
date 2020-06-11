class Requesters::RoomsController < ApplicationController
  before_action :authenticate_requester!
  before_action :correct_requester
  before_action :active_requester

  def show
  	@room = Room.find(params[:id])
  	@user = User.find(@room.user_id)
  	@requester = Requester.find(@room.requester_id)
    @message = Message.new
    @messages = Message.where(room_id: @room.id)
    @user_messages = Message.where(user_id: @user.id)
    @requester_messages = Message.where(requester_id: @requester.id)
  end

  def create
  	@user = User.new
  	@room = Room.new(user_id: params[:user_id],requester_id: current_requester.id)
    @room.save
    redirect_to requester_create_rooms_path(requester_id: current_requester.id,id: @room.id)
  end

  private
  def user_params
    params.require(:user).permit(:user_id)
  end
end
