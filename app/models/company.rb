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
end
