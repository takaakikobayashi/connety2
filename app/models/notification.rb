class Notification < ApplicationRecord
	default_scope -> { order(created_at: :desc) }
	belongs_to :user, optional: true
	belongs_to :requester, optional: true
	belongs_to :company, optional: true
	belongs_to :scholastic_record, optional: true
	belongs_to :comment, optional: true
	belongs_to :visitor, class_name: 'User', foreign_key: 'visitor_id', optional: true
  belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true

  def notification_form(notification)
    @comment=nil
    visitor=link_to notification.visitor.user_name, notification.visitor, style:"font-weight: bold;"
    your_record=link_to 'あなたの投稿', notification.scholastic_record, style:"font-weight: bold;", remote: true
    case notification.action
      when "like" then
        "#{visitor}が#{your_record}にいいね！しました"
      when "comment" then
        @comment=Comment.find_by(id:notification.comment_id)&.content
        "#{visitor}が#{your_record}にコメントしました"
      end
  end
end
