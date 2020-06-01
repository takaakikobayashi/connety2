class Companies::OfferApplicationsController < ApplicationController
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
  	@offer_applications = OfferApplication.where(offer_id: params[:offer_id])
  end

  def show
  	@offer = Offer.find(params[:offer_id])
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
