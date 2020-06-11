class Admins::UsersController < ApplicationController
	before_action :authenticate_admin!
  def index
  	@users = User.all.page(params[:page]).per(20)
  end

  def show
  end
end
