class Requesters::MessagesController < ApplicationController
	def index
	@orders = Order.where(order_status: 1)
end
end