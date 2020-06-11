class Companies::OfferApplicationsController < ApplicationController
  before_action :authenticate_company!
  before_action :correct_company
  def asset
  	@offer_application = OfferApplication.find(params[:id])
    @offer_application.update(offer_application_status: 1)
    redirect_to company_show_offer_applications_path(company_id: current_company.id,offer_id: params[:offer_id],id: params[:id])
  end

  def refuse
  	@offer_application = OfferApplication.find(params[:id])
    @offer_application.update(offer_application_status: 2)
    redirect_to company_show_offer_applications_path(company_id: current_company.id,offer_id: params[:offer_id],id: params[:id])
  end

  def index
  	@offer_applications = OfferApplication.where(offer_id: params[:offer_id]).page(params[:page]).per(20)
  end

  def show
  	@offer = Offer.find(params[:offer_id])
    @offer_application = OfferApplication.find(params[:id])
    if params[:user_id].nil?
      @room = Room.find_by(company_id: current_company.id,user_id: @offer_application.user.id)
    else
      @room = Room.find_by(company_id: current_company.id,user_id: params[:user_id])
    end
    @newroom = Room.new
  end

  def adoption
  	@offer_application = OfferApplication.find(params[:id])
    @offer_application.update(offer_application_status: 3)
    redirect_to company_show_offer_applications_path(company_id: current_company.id,offer_id: params[:offer_id],id: params[:id])
  end

  def not_adoption
  	@offer_application = OfferApplication.find(params[:id])
    @offer_application.update(offer_application_status: 4)
    redirect_to company_show_offer_applications_path(company_id: current_company.id,offer_id: params[:offer_id],id: params[:id])
  end
end
