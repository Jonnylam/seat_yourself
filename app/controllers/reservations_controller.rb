class ReservationsController < ApplicationController
	before_action :load_restaurant
  
  def new
  	@reservation = Reservation.new
  end

  def create
  	@reservation = Reservation.new(reservation_params)
  	@reservation.user = current_user
  	@reservation.restaurant = @restaurant
	  	if @reservation.save 
	  		redirect_to restaurant_url(@restaurant), notice: "Reserved homie"
	  	else
			flash[:notice] = @reservation.errors.full_messages.to_sentence
	  		render "restaurants/show"
	  	end
  end

    def show
  	@reservation = Reservation.find(params[:id])
  end


  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
      if @reservation.update_attributes(reservation_params)
        redirect_to restaurant_url(@restaurant)
      else
        render :edit
      end
  end

  def destroy
  	@reservation = Reservation.find(params[:id])
  	@reservation.destroy
  	redirect_to restaurant_url(@restaurant)
  end

  private 
  def reservation_params 
	params.require(:reservation).permit(:reservation_name, :phone_number, :party_size, :date, :time, :user_id, :restaurant_id)
  end
		 
  def load_restaurant
	@restaurant = Restaurant.find(params[:restaurant_id])
  end
end
