class Offer < ApplicationRecord
	has_many :users
	belongs_to :company
	has_many :offer

	attachment :image

	validates :industry, presence: true, length: { maximum: 20 }
	validates :occupation, presence: true, length: { maximum: 20 }
	validates :work_location, presence: true, length: { maximum: 20 }
	validates :appeal_point, presence: true, length: { maximum: 50 }
	validates :job_description, presence: true, length: { maximum: 1000 }
	validates :employment_status, presence: true, length: { maximum: 20 }
	validates :working_hour, presence: true
	validates :salary, presence: true
	validates :application_condition, presence: true, length: { maximum: 300 }
	validates :vacation, presence: true, length: { maximum: 300 }
	validates :welfare, presence: true, length: { maximum: 300 }
	validates :name, presence: true, length: { maximum: 20 }
end
