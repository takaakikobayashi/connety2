class Admins::CompaniesController < ApplicationController
	before_action :authenticate_admin!
  def index
  	@companies = Company.all.page(params[:page]).per(20)
  end
end
