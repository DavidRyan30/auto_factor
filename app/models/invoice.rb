class Invoice < ActiveRecord::Base
	has_one :customer
	has_one :employee
	has_one :part
	validates :c_id, presence: true
	validates :e_id, presence: true
	validates :p_id, presence: true
end
