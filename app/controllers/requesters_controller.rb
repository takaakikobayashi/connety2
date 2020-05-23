class RequestersController < ApplicationController
  def index
  end

  def edit
  	@requester = Requester.find(params[:id])
  end

  def show
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