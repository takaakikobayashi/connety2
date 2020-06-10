class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :setting_goals
  has_many :scholastic_records
  has_many :reviews
  has_many :likes
  has_many :tasks
  belongs_to :offer, optional: true
  has_many :orders
  has_many :problem_solutions
  has_many :notifications
  has_many :comments
  has_many :messages
  has_many :offer_aplications
  has_many :strengths
  has_many :requesters, through: :orders
  has_many :entries
  has_many :companies
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

  attachment :image

  enum grade: [ "大学1年生", "大学2年生", "大学3年生", "大学4年生", "大学院1年生", "大学院2年生", "その他" ]

  def full_name
    "#{self.last_name} #{self.first_name}"
  end

  def create_notification_order!(current_requester, order_id)
    temp = Notification.where(["requester_visitor_id = ? and visited_id = ? and order_id = ? and action = ? ",current_requester.id, order_id, id, 'order'])
    if temp.blank?
      notification = current_requester.requester_active_notifications.new(
        visited_id: id,
        order_id: order_id,
        action: 'order'
      )
      notification.save if notification.valid?
    end
  end
end
