class Admins::ScholasticRecordsController < ApplicationController
  def index
  	@categories = Category.all
  	@scholastic_records = ScholasticRecord.all.page(params[:page]).per(30)
  end
end