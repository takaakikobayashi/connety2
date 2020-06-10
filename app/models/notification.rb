class Notification < ApplicationRecord
	default_scope -> { order(created_at: :desc) }
	belongs_to :user, optional: true
	belongs_to :requester, optional: true
	belongs_to :company, optional: true
	belongs_to :scholastic_record, optional: true
	belongs_to :comment, optional: true
	belongs_to :message, optional: true
	belongs_to :room, optional: true
	belongs_to :visitor, class_name: 'User', foreign_key: 'visitor_id', optional: true
    belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true
  
    belongs_to :requester_visitor, class_name: 'Requester', foreign_key: 'requester_visitor_id', optional: true
    belongs_to :requester_visited, class_name: 'Requester', foreign_key: 'requester_visited_id', optional: true

    belongs_to :company_visitor, class_name: 'Company', foreign_key: 'company_visitor_id', optional: true
    belongs_to :company_visited, class_name: 'Company', foreign_key: 'company_visited_id', optional: true
  

end
