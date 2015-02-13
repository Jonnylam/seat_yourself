class Restaurant < ActiveRecord::Base
	has_many :reservations
	has_many :users, through: :reservations

	def available?(party_size)
		total_reservation_count = reservations.sum(:party_size)
		party_size + total_reservation_count <= capacity 
	end

	def self.search(search)
	  if search
	    where('name LIKE ?', "%#{search}%")
	  else
	  	self.all
	    # errors.add(:base, "No Restaurant Matched Your Search")
	  end
	end

end


