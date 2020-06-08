class Offer < ApplicationRecord
	has_many :users
	belongs_to :company
	has_many :offer

	attachment :image
end
