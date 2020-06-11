class Admins::RequestersController < ApplicationController
	before_action :authenticate_admin!
	def index
		@requesters = Requester.all.page(params[:page]).per(20)
	end

	def delete
	requester = Requester.find(params[:id])
    requester.update(is_active: false)
    redirect_to admins_requesters_path
	end
end