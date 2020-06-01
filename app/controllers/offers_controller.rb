class OffersController < ApplicationController
  def index
  	@offers = Offer.where(is_active: true)
  end

  def show
  	@offer = Offer.find(params[:id])
  end

  def create
  	@offer_application = OfferApplication.new
  	@offer_application.user_id = current_user.id
  	@offer_application.company_id = params[:company_id].to_i
  	@offer_application.offer_id = params[:id].to_i
  	if @offer_application.save
  		redirect_to user_path(current_user.id)
  	else
  		@offers = Offer.where(is_active: true)
  		render action: :index
  	end
  end

  def destroy
  end

end
