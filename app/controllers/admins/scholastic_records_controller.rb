class Admins::ScholasticRecordsController < ApplicationController
	before_action :authenticate_admin!
  def index
  	@categories = Category.all
  	@scholastic_records = ScholasticRecord.all.page(params[:page]).per(30)
  end
end