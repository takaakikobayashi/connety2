class Admins::NewsController < ApplicationController
  def new
  	@news = News.new
  end

  def create
  	@news =  News.new(news_params)
    if @news.save
      redirect_to news_index_path
    else
      render :new
    end
  end

  private
  def news_params
    params.require(:news).permit(:category, :content)
  end
end
