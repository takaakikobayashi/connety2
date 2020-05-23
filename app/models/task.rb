class Task < ApplicationRecord
	belongs_to :user
	has_many :scholastic_record
end
