class Restaurant < ActiveRecord::Base
	has_many :reservations
	has_many :users, through: :reservations

	def available?(party_size, date, time)
		total_reservation_count = reservations.where(date: date, time: time).sum(:party_size)
		party_size + total_reservation_count <= capacity 
	end

	def self.search(search)
	  if search
	    where('LOWER(name) LIKE ?', "%#{search.downcase}%")
	  else
	  	self.all
	    # errors.add(:base, "No Restaurant Matched Your Search")
	  end
	end

end




	# def time_slot_available 
	# 	reservation_interval = 1.hour #one hour intervals
	# 	timenow = Time.zone.now
	# 	start_time = restaurant.time: opens_at] #opening_time
	# 	full_hours = [] #empty array which we put our one hour intervals in
	# 	time_slots = start_time #opening time for the restaurant is equal to start_time
	# 	last_possible_reservation = (timenow + 7.days)

	# 	begin #puts an array of one hour intervals for each restaurant
	# 		full_hours << time_slots #add the start_time first into the array
	# 		time_slots += reservation_interval #Add one hour to a_time
	# 	end while time_slots < last_possible_reservation #Adds until 7 days later (BUT DOESNT WORK)

	# 	#need to define a method for each time interval in the array. 
	# 	full_hours.each do |party_size, date, time|
	# 		total_reservation_count = reservations.where(date: date, time: time).sum(:party_size)
	# 		party_size + total_reservation_count <= capacity 
	# 	end 
	# 	full hours
	# end

		# closing_time = restaurant[:closes_at] #closing time
		# date = restaurant.reservation[:date]
		# NOT SURE IF I NEED MB FOR LATER