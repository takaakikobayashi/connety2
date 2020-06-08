module NotificationsHelper
  def user_unchecked_notifications
    @notifications = current_user.passive_notifications.where(checked: false)
  end

  def user_message_unchecked_notifications
  	@message_notifications = current_user.passive_notifications.where(checked: false, action: 'message')
  end

  def requester_unchecked_notifications
    @notifications = current_requester.requester_passive_notifications.where(checked: false)
  end

  def requester_message_unchecked_notifications
  	@message_notifications = current_requester.requester_passive_notifications.where(checked: false, action: 'message')
  end

  def company_unchecked_notifications
    @notifications = current_company.company_passive_notifications.where(checked: false)
  end

  def company_message_unchecked_notifications
  	@message_notifications = current_company.company_passive_notifications.where(checked: false, action: 'message')
  end
end