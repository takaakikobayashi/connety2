class RequestersController < ApplicationController
  def index
  end

  def edit
  	@requester = Requester.find(params[:id])
  end

  def show
    @orders = Order.where(progress_status: 1)
    @order = Order.find(params[:id])
    @room = Room.find_by(requester_id: current_requester.id,user_id: @order.user.id)
    @newroom = Room.new
  end

  def update
    @requester = Requester.find(current_requester.id)
    if @requester.update(requester_params)
       redirect_to requester_path(@requester)
    else
       render :edit
    end
  end

  def destroy
    @requester = Requester.find(current_requester.id)
    @requester.destroy
    redirect_to root_path
  end

  private
  def requester_params
    params.require(:requester).permit(
      :name,
      :business_name,
      :postal_code,
      :address,
      :email,
      :phone_number
    )
  end
end