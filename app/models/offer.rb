class Offer < ApplicationRecord
	belongs_to :user
	belongs_to :company
	has_many :ofer_application
end
