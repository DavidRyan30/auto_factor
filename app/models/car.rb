class Car < ActiveRecord::Base
	has_many :parts, dependent: :destroy 
	validates :make, presence: true,
			inclusion: { in: %w(Ford Toyota Nissan Honda Renault)}
	validates :model, presence: true
	validates :year, presence: true
end
