class Companies::ReviewsController < ApplicationController
	before_action :authenticate_company!
	before_action :active_company
  def index
  	@reviews = Review.where(user_id: params[:user_id]).page(params[:page]).per(20)
  end

  private
  def review_params
    params.require(:review).permit(:theme, :completion, :halfway)
  end
end
