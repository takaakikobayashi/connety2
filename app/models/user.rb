class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :setting_goal
  has_many :scholastic_record
  has_many :review
  has_many :like
  has_many :task
  has_many :offer
  has_many :order
  has_many :problem_solution
  has_many :notification
  has_many :comment
  has_many :message
  has_many :offer_aplication
  has_many :strength

  attachment :image
end
