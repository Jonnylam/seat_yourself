class RestaurantsController < ApplicationController
	def find_restaurant
		Restaurant.find(params[:id])
	end

	def all
		@restaurants = Restaurant.all
	end

	def index
		@restaurants = Restaurant.all
		@search = Restaurant.search(params[:search])
	end

	def new
		@restaurant = Restaurant.new
	end

	def show
		@restaurant = find_restaurant

		if current_user
			# @reservation = @restaurant.reservations.build
			@reservation = Reservation.new
		end
	end

	def create
		@restaurant = Restaurant.new(restaurant_params)

		if @restaurant.save
			redirect_to restaurants_url
		else
			render :new
		end
	end

	def update
		@restaurant = find_restaurant

		if @restaurant.update_attributes(restaurant_params)
			redirect_to restaurant_url(@restaurant)
		else
			render :edit
		end
	end

	def edit
		@restaurant = find_restaurant
	end

	def destroy
		@restaurant = find_restaurant
		@restaurant.destroy
		redirect_to restaurants_url
	end

	def search
		@restaurants = Restaurant.search(params[:search])
		render :all
		# flash[:notice] = @restaurant.errors.full_messages.to_sentence
	end

	
	private
	def restaurant_params
		params.require(:restaurant).permit(:name, :capacity, :opens_at, :closes_at, 
			:picture_url, :description, :address, :phone)
	end

end
