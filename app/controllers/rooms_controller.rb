class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user
  before_action :active_user

  def show
  	@room = Room.find(params[:id])
  	@user = User.find(@room.user_id)
    if @room.requester_id.present?
  	   @requester = Requester.find(@room.requester_id)
    elsif @room.company_id.present?
          @company = Company.find(@room.company_id)
    end
    @message = Message.new
    @messages = Message.where(room_id: @room.id)
    @user_messages = Message.where(user_id: @user_id)
    if @requester.present?
      @requester_messages = Message.where(requester_id: @requester_id)
    elsif @company.present?
      @company_messages = Message.where(company_id: @company_id)
    end
    @notifications = current_user.passive_notifications
    @notifications.where(checked: false, action: 'message').each do |notification|
      notification.update_attributes(checked: true)
    end
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
