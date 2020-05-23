class Notification < ApplicationRecord
	belongs_to :user
	belongs_to :requester
	belongs_to :company
	belongs_to :scholastic_record
	belongs_to :comment
end
