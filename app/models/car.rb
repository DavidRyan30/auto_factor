class Car < ActiveRecord::Base
	has_many :parts, dependent: :destroy 
	validates :make, presence: true,
			inclusion: { in: %w(Ford Toyota Nissan Honda Renault)}
	validates :model, presence: true
	validates :year, presence: true

# 	def find_models(make)
# 		sql = "select distinct model from cars where make = #{make}"
# 		car_models = ActiveRecord::Base.connection.execute(sql)
# 	end
end
