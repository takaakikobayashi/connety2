class Requesters::MessagesController < ApplicationController
	before_action :authenticate
	before_action :correct_requester
	before_action :active_requester
  def index
	@orders = Order.where(order_status: 1,requester_id: current_requester.id).page(params[:page]).per(20)
  end
end