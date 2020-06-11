class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user
  before_action :active_user
  def index
  	@orders = Order.where(user_id: current_user.id).page(params[:page]).per(20).order(created_at: "DESC")
  end

  def show
    @order = Order.find(params[:id])
    @room = Room.find_by(user_id: current_user.id,requester_id: @order.requester.id)
    @newroom = Room.new
  end

  def refuse
  	@order = Order.find(params[:id])
    @order.update(order_status: 2,progress_status: 3)
    redirect_to user_orders_path(current_user.id)
  end

  def asset
  	@order = Order.find(params[:id])
    @order.update(order_status: 1,progress_status: 1)
    @order.create_requester_notification_order!(current_user, @order.id)
    redirect_to user_orders_path(current_user.id)
  end

  def cansel
    @order = Order.find(params[:id])
    @order.update(order_status: 3,progress_status: 3)
    redirect_to user_orders_path(current_user.id)
  end

  def dm
  end

  private
  def order_params
    params.require(:order).permit(
      :request_content,
      :request_detail,
      :cost,
      :progress_status,
      :order_status
    )
  end
end
