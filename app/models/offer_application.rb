class OfferApplication < ApplicationRecord
	belongs_to :user
	belongs_to :company
	belongs_to :offer
end
