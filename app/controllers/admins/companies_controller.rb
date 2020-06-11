class Admins::CompaniesController < ApplicationController
	before_action :authenticate_admin!
  def index
  	@companies = Company.all.page(params[:page]).per(20)
  end

  def delete
  	company = Company.find(params[:id])
    company.update(is_active: false)
    redirect_to admins_companies_path
  end
end
