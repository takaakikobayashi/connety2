class Companies::OffersController < ApplicationController
  before_action :authenticate_company!
  before_action :correct_company
  before_action :active_company
  def index
    @offers = Offer.where(company_id: current_company.id).page(params[:page]).per(20)
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

  def delete
    @offer = Offer.find(params[:id])
    @offer.update(is_active: false)
    redirect_to company_path(current_company.id)
  end

  def release
    @offer = Offer.find(params[:id])
    @offer.update(is_active: true)
    redirect_to company_path(current_company.id)
  end

  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy
    redirect_to company_offers_path(current_company.id)
  end

  private
  def offer_params
    params.require(:offer).permit(:industry, :occupation, :work_location, :appeal_point, :job_description, :working_hour, :salary, :vacation, :welfare, :application_condition, :employment_status, :image, :name)
  end
end