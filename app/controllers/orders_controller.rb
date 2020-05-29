class OrdersController < ApplicationController
  def index
  	@orders = Order.where(user_id: current_user.id)
  end

  def show
  end

  def refuse
  	@order = Order.find(params[:id])
    @order.update(order_status: 2,progress_status: 3)
    redirect_to user_orders_path(current_user.id)
  end

  def asset
  	@order = Order.find(params[:id])
    @order.update(order_status: 1,progress_status: 1)
    redirect_to user_orders_path(current_user.id)
end

private
  def order_params
    params.require(:order).permit(:request_content, :request_detail, :cost, :progress_status, :order_status)
  end
end
