class ScholasticRecord < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many :likes
	has_many :comments
	def liked_by?(user)
            like.where(user_id: user.id).exists?
        end
end
