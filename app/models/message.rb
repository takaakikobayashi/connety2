class Message < ApplicationRecord
	belongs_to :user, optional: true
	belongs_to :requester, optional: true
	belongs_to :company, optional: true
	belongs_to :room
end
