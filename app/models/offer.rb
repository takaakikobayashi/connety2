class Offer < ApplicationRecord
	has_many :user
	belongs_to :company
	has_many :offer_application

	attachment :image
end
