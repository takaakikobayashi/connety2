class Requester < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :messages
  has_many :notifications
  has_many :orders, through: :orders
  has_many :entries
  has_many :users
  has_many :requester_active_notifications, class_name: 'Notification', foreign_key: 'requester_visitor_id', dependent: :destroy
  has_many :requester_passive_notifications, class_name: 'Notification', foreign_key: 'requester_visited_id', dependent: :destroy


end
