module ApplicationHelper
	def restaurant_times(restaurant)
		times = (restaurant.opens_at...restaurant.closes_at).map do |hours| 
			[time_view(hours), hours]
		end
		times
	end

	def time_view(time)
	 	other_displays_for_time = 1
	 	time_display = Time.new(other_displays_for_time, other_displays_for_time, other_displays_for_time, time, 00, other_displays_for_time)
		time_display.strftime("%I:%M %p")
	end

	def seven_days
		seven_days.where(Date.today..1.week.from_now)
	end
end


	# def reservation_time_options(restaurant)

	# 	def restaurant_times(start, finish)
	# 		(start..finish).map do |hour|
	# 		[pretty_time(hour), hour]	# options_for_select(times)
	# 		end
	# 	end

	# 	if resstaurant.opens_at == restaurant.closes_at
	# 		(0..23).map do |hour|
	# 		[pretty_time(hour), hour]
	# 	elsif restaurant.closes_at < restaurant.opens_at
	# 		times = restaurant_times(0, restaurant.closes_at).concat(restaurant_times(restaurant.opens_at, 23))	
	# 	else times = (restaurant.opens_at...restaurant.closes_at).map do |hour|
	# 		[pretty_time(hour), hour]
	# 		end
	# 	times
	# 	end
	# end
	# If the restaurant is open past 12