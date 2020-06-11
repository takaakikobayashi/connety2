class Strength < ApplicationRecord
	belongs_to :user

	validates :skill, presence: true, length: { maximum: 50 }
	validates :appeal_point, presence: true, length: { maximum: 100 }
	validates :expection, length: { maximum: 50 }
	validates :portfolio, length: { maximum: 50 }
end
