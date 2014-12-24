class AjaxController < ApplicationController
	
	def get_hotels
		city = City.find(params[:city_id])
		@hotels = city.hotels
	end
	
	def get_rooms
		hotel = Hotel.find(params[:hotel_id])
		@rooms = hotel.rooms
	end

	def submit
	end

	def book
		room = Room.find(params[:room_id])
		@booking = room.bookings.new user_name: params[:user_name], date_start: params[:date_start], date_end: params[:date_end]
		respond_to do |format|
			if room.is_booked?(params[:date_start], params[:date_end])
				format.json { render :json => true }
			else
				if @booking.save
					format.json { render :json => false }
				end
			end
		end
		
	end
end
