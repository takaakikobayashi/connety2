class NewsController < ApplicationController
	def index
		@news = News.all.page(params[:page]).per(20)
	end
end