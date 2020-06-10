class Room < ApplicationRecord
	has_many :messages
	has_many :entries
	has_many :users
	has_many :requesters
	has_many :companies
	has_many :notifications, dependent: :destroy
	def create_user_notification_message!(current_requester, message_id)
	  notification = current_requester.requester_active_notifications.new(
		    room_id: id,
        visited_id: user_id,
        message_id: message_id,
        action: 'message'
      )
      notification.save
    end

    def create_c_user_notification_message!(current_company, message_id)
	  notification = current_company.company_active_notifications.new(
		    room_id: id,
        visited_id: user_id,
        message_id: message_id,
        action: 'message'
      )
      notification.save
    end

    def create_requester_notification_message!(current_user, message_id)
	  notification = current_user.active_notifications.new(
		    room_id: id,
        requester_visited_id: requester_id,
        message_id: message_id,
        action: 'message'
      )
      notification.save
    end

    def create_company_notification_message!(current_user, message_id)
      notification = current_user.active_notifications.new(
		    oom_id: id,
        company_visited_id: company_id,
        message_id: message_id,
        action: 'message'
      )
      notification.save
    end
end
