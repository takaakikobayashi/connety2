class OfferApplicationsController < ApplicationController
	def index
		@offer_applications = OfferApplication.all
	end

	def show
	end

	def pass
		@offer_applications = OfferApplication.where(offer_application_status: 1)
	end
end