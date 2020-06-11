class OfferApplicationsController < ApplicationController
	before_action :authenticate_user!
	before_action :correct_user
	def index
		@offer_applications = OfferApplication.all.page(params[:page]).per(20)
	end

	def show
	end

	def pass
		@offer_applications = OfferApplication.where(offer_application_status: 1).page(params[:page]).per(20)
	end
end