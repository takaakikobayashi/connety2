class Requesters::OrdersController < ApplicationController
  def new
  end

  def create
  end

  def index
  end

  def destroy
  end

  def complete
  	@order = Order.find(params[:id])
    @order.update(progress_status: complete)
    redirect_to requester_path(current_requester.id)
  end

  def delete
  	@order = Order.find(params[:id])
    @order.update(progress_status: fracture)
    redirect_to requester_path(current_requester.id)
  end

  private
  def order_params
    params.require(:order).permit(:request_content, :request_detail, :cost, :progress_status)
  end
end
