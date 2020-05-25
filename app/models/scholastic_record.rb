class ScholasticRecord < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many :like
end
