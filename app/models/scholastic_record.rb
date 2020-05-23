class ScholasticRecord < ApplicationRecord
	belongs_to :user
	belongs_to :category
	belongs_to :task
	has_many :like
end
