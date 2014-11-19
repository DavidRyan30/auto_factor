class Invoice < ActiveRecord::Base
	has_one :customer
	has_one :employee
	has_one :part
end
