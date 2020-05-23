class Message < ApplicationRecord
	belongs_to :user
	belongs_to :requester
	belongs_to :company
end
