class ProblemSolution < ApplicationRecord
	belongs_to :user

	validates :worked, presence: true, length: {maximum:100}
	validates :not_worked, presence: true, length: {maximum:100}
	validates :solution, presence: true, length: {maximum:100}
	validates :improvement_point, presence: true, length: {maximum:100}
	validates :cause, presence: true, length: {maximum:100}
end
