class Category < ApplicationRecord
	has_many :scholastic_records

	validates :name, presence: true
end
