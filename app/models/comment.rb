class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :scholastic_record
	has_many :notifications, dependent: :destroy

	validates :content, presence: true

end
