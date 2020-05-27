class Requesters::ReviewsController < ApplicationController
  def index
  	@reviews = Review.where(user_id: params[:user_id])
  end

  def show
  end
end
