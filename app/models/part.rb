class Part < ActiveRecord::Base
	before_save do |part| 
    	part.part_name=part_name.downcase
    end
	belongs_to :car
	has_many :invoices
	validates :car_id, presence: true
	validates :part_name, presence: true
	validates :part_price, presence: true 
	
end
