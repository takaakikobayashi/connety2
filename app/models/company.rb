class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :offer_applications
  has_many :messages
  has_many :notifications
  has_many :offers
  has_many :entries
  has_many :users
  has_many :company_active_notifications, class_name: 'Notification', foreign_key: 'company_visitor_id', dependent: :destroy
  has_many :company_passive_notifications, class_name: 'Notification', foreign_key: 'company_visited_id', dependent: :destroy

  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true
  validates :postal_code, presence: true, length: { is: 7 }, numericality: { only_integer: true }
  validates :address, presence: true
  validates :phone_number, presence: true, numericality: { only_integer: true }


end
