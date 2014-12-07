class Employee < ActiveRecord::Base
	before_save do |employee| 
    	employee.remember_token = SecureRandom.urlsafe_base64
    end
    has_many :invoices
	validates :password, presence: true, length: { minimum: 6 }
    validates :password_confirmation, presence: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :emp_email, presence: true,
		 format: {with: VALID_EMAIL_REGEX},
		 uniqueness: { case_sensitive: false}

    has_secure_password

end
