class OfferApplication < ApplicationRecord
	belongs_to :user
	belongs_to :company
	belongs_to :offer, optional: true
	has_many :notifications, dependent: :destroy

	enum offer_application_status: ["応募確認中", "選考中", "お断り", "採用", "不採用"]
end
