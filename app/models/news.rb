class News < ApplicationRecord

	validates :category, presence: true
	validates :content, presence: true, length: { maximum: 100 }
end
