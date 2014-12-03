class Part < ActiveRecord::Base
	before_save do |part| 
    	part.part_name=part_name.downcase
  end

	belongs_to :car
  belongs_to :cart
	validates :car_id, presence: true
	validates :part_name, presence: true
	validates :part_price, presence: true
end
