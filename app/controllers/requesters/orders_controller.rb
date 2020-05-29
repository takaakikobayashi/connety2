class Requesters::OrdersController < ApplicationController
  def new
  	@order = Order.new
  end

  def create
  	@order = Order.new(order_params)
  	@order.requester_id = current_requester.id
  	@order.user_id = params[:user_id].to_i
  	if @order.save
  		redirect_to requester_path(current_requester.id)
  	else
  		render action: :new
  	end
  end

  def index
  	@orders = Order.all
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
