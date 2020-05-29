class Entry < ApplicationRecord
	belongs_to :user
	belongs_to :requester
	belongs_to :company
	belongs_to :room
end
