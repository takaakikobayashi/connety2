class ScholasticRecord < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many :like
	has_many :comment
	def liked_by?(user)
            like.where(user_id: user.id).exists?
        end
end
