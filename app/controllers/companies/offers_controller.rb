class Companies::OffersController < ApplicationController
  def index
    @offers = Offer.all
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.company_id = current_company.id
    if @offer.save
      redirect_to company_offers_path(current_company.id)
    else
      render action: :new
    end
  end

  def show
    @offer = Offer.find(params[:id])
  end

  def edit
    @offer = Offer.find(params[:id])
  end

  def update
    @offer = Offer.find(params[:id])
    if @offer.update(offer_params)
      redirect_to company_offers_path(current_company.id)
    else
      render action: :edit
    end
  end

  private
  def offer_params
    params.require(:offer).permit(:industry, :occupation, :work_location, :appeal_point, :job_description, :working_hour, :salary, :vacation, :welfare, :application_condition, :employment_status)
  end
end