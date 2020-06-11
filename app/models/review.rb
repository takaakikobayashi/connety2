class Review < ApplicationRecord
	belongs_to :user

	validates :theme, presence: true, length: {maximum:30}
	validates :completion, presence: true, length: {maximum:100}
	validates :halfway, presence: true, length: {maximum:100}
end
