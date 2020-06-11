class Requesters::ReviewsController < ApplicationController
	before_action :authenticate_requester!
  before_action :active_requester
  def index
  	@reviews = Review.where(user_id: params[:user_id]).page(params[:page]).per(20)
  end

  def show
  end

  private
  def review_params
    params.require(:review).permit(:theme, :completion, :halfway)
  end
end
