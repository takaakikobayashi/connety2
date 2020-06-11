class Requesters::NotificationsController < ApplicationController
	before_action :authenticate_requester!
	before_action :correct_requester
  def index
  	@notifications = current_requester.requester_passive_notifications.page(params[:page]).per(20)
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end
end
