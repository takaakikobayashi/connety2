class Admins::OrdersController < ApplicationController
	before_action :authenticate_admin!
  def index
  	@orders = Order.all.page(params[:page]).per(20)
  end

  def show
  end
end
