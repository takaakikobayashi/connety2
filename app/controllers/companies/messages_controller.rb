class Companies::MessagesController < ApplicationController
	before_action :authenticate
	before_action :correct_company
	before_action :active_company
  def index
  	  @offer_applications = OfferApplication.where(company_id: current_company.id).page(params[:page]).per(20)
  end
end