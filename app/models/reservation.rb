class Reservation < ActiveRecord::Base
	belongs_to :user
	belongs_to :restaurant

	validates :party_size, presence: true
	validate :availability 

	private 
	def availability
		if !restaurant.available?(party_size)
			errors.add(:base, "Restaurant is full for this time")
		end
	end
end


