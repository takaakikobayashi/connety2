class RequestersController < ApplicationController
  def index
    @categories = Category.all
    if params["category_id"].nil?
      @scholastic_records = ScholasticRecord.all.page(params[:page]).per(30)
    else
      @scholastic_records = ScholasticRecord.where(category_id: params["category_id"]).page(params[:page]).per(30)
    end
  end

  def edit
  	@requester = Requester.find(params[:id])
  end

  def show
    @orders = Order.where(progress_status: 1)
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