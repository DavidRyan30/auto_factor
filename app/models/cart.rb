class Cart < ActiveRecord::Base
	before_save do |cart| 
    	cart.cart_token = SecureRandom.urlsafe_base64
    end
    has_many :parts, dependent: :destroy
end
