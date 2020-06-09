class Companies::MessagesController < ApplicationController
  def index
  	@offer_applications = OfferApplication.where(offer_application_status: 1)
  	end
  end