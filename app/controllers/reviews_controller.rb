class ReviewsController < ApplicationController
  def index
  	@reviews = Review.all
  end

  def new
  	@review = Review.new
  	now = Date.today
  	@reviews = Review.find_by(created_at: now.yesterday)
  end

  def create
  	@review = Review.new(review_params)
  	@review.user_id = current_user.id
  	if @review.save
  		redirect_to user_reviews_path(current_user.id)
  	else
  		render action: :new
  	end
  end

  private
  def review_params
    params.require(:review).permit(
      :theme,
      :completion,
      :halfway
    )
  end
end
