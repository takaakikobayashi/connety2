class Companies::RoomsController < ApplicationController

  def show
  	@room = Room.find(params[:id])
  	@user = User.find(@room.user_id)
  	@company = Company.find(@room.company_id)
    @message = Message.new
    @messages = Message.where(room_id: @room.id)
    @user_messages = Message.where(user_id: @user.id)
    @company_messages = Message.where(company_id: @company.id)
  end

  def create
  	@user = User.new
  	@room = Room.new(user_id: params[:user_id],company_id: current_company.id)
    @room.save
    redirect_to company_create_rooms_path(company_id: current_company.id,id: @room.id)
  end

  private
  def user_params
    params.require(:user).permit(:user_id)
  end
end
