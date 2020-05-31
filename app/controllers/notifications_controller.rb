class NotificationsController < ApplicationController
  def index
  	@notifications = current_user.passive_notifications
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
      end
    @comment = Comment.find_by(id: @notifications.comment_id)
    @visitor = User.find_by(id: @mynotifications.user_id)
    @mynotifications = @notifications.where.not(visitor_id: current_user.id)
  end
end
