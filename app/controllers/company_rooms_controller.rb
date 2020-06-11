class CompanyRoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user
  before_action :active_company

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
  	@company = Company.new
  	@room = Room.new(company_id: params[:company_id],user_id: current_user.id)
    @room.save
    redirect_to user_company_room_path(user_id: current_user.id,id: @room.id)
  end

  private
  def requester_params
    params.require(:company).permit(:company_id)
  end
end
