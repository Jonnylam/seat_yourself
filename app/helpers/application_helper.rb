module ApplicationHelper
	def restaurant_times(restaurant)
		times = (restaurant.opens_at...restaurant.closes_at).map do |hours| 
			[time_view(hours), hours]
		end
		times
	end

	def time_view(time)
	 	"#{time}:00"
	end

end
