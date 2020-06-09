class Requesters::OrdersController < ApplicationController
  def new
  	@order = Order.new
  end

  def create
  	@order = Order.new(order_params)
  	@order.requester_id = current_requester.id
  	@order.user_id = params[:user_id].to_i
    @user = User.find(params[:user_id])
  	if @order.save
      @user.create_notification_order!(current_requester, @order.id)
  		redirect_to requester_path(current_requester.id)
  	else
  		render action: :new
  	end
  end

  def show
    @order = Order.find(params[:id])
    if params[:user_id].nil?
      @order = Order.find(params[:id])
      @room = Room.find_by(requester_id: current_requester.id,user_id: @order.user.id)
    else
      @room = Room.find_by(requester_id: current_requester.id,user_id: params[:user_id])
    end
    @newroom = Room.new
  end

  def index
  	@orders = Order.all.order(created_at: "DESC")
  end

  def destroy
  end

  def complete
  	@order = Order.find(params[:id])
    @order.update(progress_status: 2)
    redirect_to requester_path(current_requester.id)
  end

  def delete
  	@order = Order.find(params[:id])
    @order.update(progress_status: 3)
    redirect_to requester_path(current_requester.id)
  end

  private
  def order_params
    params.require(:order).permit(:request_content, :request_detail, :cost, :progress_status)
  end
end
