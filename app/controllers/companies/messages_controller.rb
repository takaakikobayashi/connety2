class Companies::MessagesController < ApplicationController
	before_action :authenticate
	before_action :correct_company
	before_action :active_company
  def index
  	@offer_applications = OfferApplication.where(offer_application_status: 1).page(params[:page]).per(20)
  	end
  end