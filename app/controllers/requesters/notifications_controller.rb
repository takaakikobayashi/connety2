class Requesters::NotificationsController < ApplicationController
  def index
  	@notifications = current_requester.requester_passive_notifications
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end
end
