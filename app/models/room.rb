class Room < ApplicationRecord
	has_many :messages
	has_many :entries
	has_many :users
	has_many :requesters
	has_many :companies
end
