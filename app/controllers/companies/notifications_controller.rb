class Companies::NotificationsController < ApplicationController
	before_action :authenticate_company!
	before_action :correct_company
	before_action :active_company
  def index
  	@notifications = current_company.company_passive_notifications.page(params[:page]).per(20)
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end
end
