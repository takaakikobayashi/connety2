class Admins::UsersController < ApplicationController
	before_action :authenticate_admin!
  def index
  	@users = User.all.page(params[:page]).per(20)
  end

  def show
  end

  def delete
  	user = User.find(params[:id])
    user.update(is_active: false)
    redirect_to admins_users_path
  end
end
