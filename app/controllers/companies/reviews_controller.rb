class Companies::ReviewsController < ApplicationController
  def index
  	@reviews = Review.where(user_id: params[:user_id])
  end

  private
  def review_params
    params.require(:review).permit(:theme, :completion, :halfway)
  end
end
