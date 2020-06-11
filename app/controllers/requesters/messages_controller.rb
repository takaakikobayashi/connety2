class Requesters::MessagesController < ApplicationController
	before_action :authenticate_requester!
	before_action :correct_requester
	before_action :active_requester
  def index
	@orders = Order.where(order_status: 1).page(params[:page]).per(20)
  end
end