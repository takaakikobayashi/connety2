class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user
  before_action :active_user

  def index
    @orders = Order.where(order_status: 1).page(params[:page]).per(20)
    @offer_applications = OfferApplication.where(offer_application_status: 1).page(params[:page]).per(20)
  end
  
  def create
    @message = Message.new(message_params)
    if message_params[:requester_id].nil? and message_params[:company_id].nil?
      @message.user_id = message_params[:user_id].to_i
    elsif message_params[:user_id].nil? and message_params[:company_id].nil?
      @message.requester_id = message_params[:requester_id].to_i
    else
      @message.company_id = message_params[:company_id].to_i
    end
    @message.room_id = message_params[:room_id].to_i
    @message.save
    room = @message.room
    if message_params[:requester_id].nil? and message_params[:company_id].nil? and room.company_id.nil?
      room.create_requester_notification_message!(current_user, @message.id)
    elsif message_params[:requester_id].nil? and message_params[:company_id].nil? and room.requester_id.nil?
      room.create_company_notification_message!(current_user, @message.id)
      elsif message_params[:user_id].nil? and message_params[:company_id].nil?
    room.create_user_notification_message!(current_requester, @message.id)
  elsif message_params[:user_id].nil? and message_params[:requester_id].nil?
    room.create_c_user_notification_message!(current_company, @message_id)
  end
    if message_params[:requester_id].nil? and message_params[:company_id].nil? and room.company_id.nil?
      redirect_to "/users/#{@message.user_id}/rooms/#{@message.room_id}"
    elsif message_params[:requester_id].nil? and message_params[:company_id].nil? and room.requester_id.nil?
      redirect_to "/users/#{@message.user_id}/company_rooms/#{@message.room_id}"
    elsif message_params[:user_id].nil? and message_params[:company_id].nil?
      redirect_to "/requesters/#{@message.requester_id}/rooms/#{@message.room_id}"
    else
      redirect_to "/companies/#{@message.company_id}/rooms/#{@message.room_id}"
    end
  end

  private
  def message_params
    params.require(:message).permit(:mail,:room_id,:user_id,:requester_id,:company_id)
  end
end
