class Order < ApplicationRecord
	belongs_to :user
	belongs_to :requester
	has_many :notifications, dependent: :destroy

	enum progress_status: ["オファー待ち", "進行中", "完了", "破断"]
	enum order_status: ["オファー中", "受諾", "お断り", "キャンセル"]

  validates :cost, presence: true
  validates :request_content, presence: true, length: {maximum:30}
  validates :request_detail, presence: true, length: {maximum:500}

	def create_requester_notification_order!(current_user, order_id)
    notification = current_user.active_notifications.new(
        order_id: order_id,
        requester_visited_id: requester_id,
        action: 'order'
      )
      notification.save
    end
end
