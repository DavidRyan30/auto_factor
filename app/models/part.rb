class Part < ActiveRecord::Base
	belongs_to :car
	validates :part_name, presence: true
	validates :part_price, presence: true 
end
