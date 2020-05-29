class Order < ApplicationRecord
	belongs_to :user
	belongs_to :requester

	enum progress_status: ["オファー待ち", "進行中", "完了", "破断"]
	enum order_status: ["オファー中", "受諾", "お断り"]
end
