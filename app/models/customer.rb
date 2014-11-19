class Customer < ActiveRecord::Base
	has_many :invoices
	validate :cust_name, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :cust_email, presence: true,
		 format: {with: VALID_EMAIL_REGEX},
		 uniqueness: { case_sensitive: false}	
end
