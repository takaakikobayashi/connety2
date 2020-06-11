class SettingGoal < ApplicationRecord
	belongs_to :user

	validates :target, presence: true, length: { maximum: 20 }
	validates :concern, presence: true, length: { maximum: 100 }
	validates :commitment, presence: true, length: { maximum: 100 }
end
