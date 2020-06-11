class Companies::MessagesController < ApplicationController
	before_action :authenticate_company!
	before_action :correct_company
  def index
  	@offer_applications = OfferApplication.where(offer_application_status: 1).page(params[:page]).per(20)
  	end
  end