class CompanyRoomsController < ApplicationController

  def show
  	@room = Room.find(params[:id])
  	@user = User.find(@room.user_id)
    @company = Company.find(@room.company_id)
    @message = Message.new
    @messages = Message.where(room_id: @room.id)
    @user_messages = Message.where(user_id: @user_id)
    @company_messages = Message.where(company_id: @company_id)
  end

  def create
  	@requester = Requester.new
  	@room = Room.new(requester_id: params[:requester_id],user_id: current_user.id)
    @room.save
    redirect_to user_room_path(user_id: current_user.id,id: @room.id)
  end

  private
  def requester_params
    params.require(:requester).permit(:requester_id)
  end
end
