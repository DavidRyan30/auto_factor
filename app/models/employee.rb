class Employee < ActiveRecord::Base
	before_save do |employee| 
    	employee.remember_token = SecureRandom.urlsafe_base64
    end
	validates :password, presence: true, length: { minimum: 6 }
    validates :password_confirmation, presence: true

    has_secure_password
   
end
