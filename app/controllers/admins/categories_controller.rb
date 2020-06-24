class Admins::CategoriesController < ApplicationController
  def new
  	@category = Category.new
  end

  def create
  end

  def index
  	@category = Category.all
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
