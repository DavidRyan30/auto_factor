class Customer < ActiveRecord::Base
	validate :cust_name presence: true
end
