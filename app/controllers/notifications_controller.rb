class NotificationsController < ApplicationController
  def index
  	@notifications = current_user.passive_notifications
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
      end
      @mynotifications = @notifications.where.not(visitor_id: current_user.id)
    @visitor = User.find(@mynotifications.action.visitor_id)
    @visited = User.find_by(id: @mynotifications.visited_id)
    @comment = Comment.find_by(id: @notifications.visitor_id)
  end
end
