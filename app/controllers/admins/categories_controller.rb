class Admins::CategoriesController < ApplicationController
  def new
  	@category = Category.new
  end

  def create
    @category =  Category.new(category_params)
    if @category.save
      redirect_to admins_categories_index_path
    else
      render :new
    end
  end

  def index
  	@category = Category.all
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
       redirect_to admins_categories_index_path
    else
       render action: :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to admins_categories_index_path
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
