class Admins::CompaniesController < ApplicationController
  def index
  	@companies = Company.all
  end
end
