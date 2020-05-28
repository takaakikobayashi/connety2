class Order < ApplicationRecord
	belongs_to :user
	belongs_to :requester

	enum progress_status:[:doing, :complete, :fracture]
end
