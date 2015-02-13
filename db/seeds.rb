
def random_hour(from, to)
  (Date.today + rand(from..to).hour + rand(0..60).minutes).to_datetime
end

puts "\nCreating users"
100.times do
	User.create!(
		email: Faker::Internet.email,
		name:  Faker::Name.name,
		password: "asdf;lkj"
	)
	print "|"
end

puts "\nCreating restaurants"
50.times do
	name = "#{["Bob's", "Eddy's", "Sue's", "Charleses"].sample} #{["Fried", "Baked", "Stewed"].sample} #{["Chicken", "Pies", "Sandwiches", "Soup's"].sample}"
	Restaurant.create!(
		picture_url: Faker::Company.logo,
		name: name,
		capacity: [20, 40, 60, 200].sample,
		opens_at: [9, 10, 11].sample,
		closes_at: [20, 21, 22, 23].sample,
		description: Faker::Company.catch_phrase,
		address: Faker::Address.street_address,
		phone: Faker::PhoneNumber.phone_number
	)
	print "|"
end

puts "\nCreating reservations"
1000.times do
	Reservation.create!(
		reservation_name: Faker::Name.name,
		phone_number: Faker::PhoneNumber.phone_number, 
		party_size: [1,3,4,6,10].sample,
		time: [11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23].sample,
		user_id: User.all.sample.id,
		restaurant_id: Restaurant.all.sample.id
	)
	print "|"
end