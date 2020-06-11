class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:new, :create]
  def index
  	@reviews = Review.all.page(params[:page]).per(20).order(created_at: "DESC")
    @user = User.find(params[:user_id])
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
