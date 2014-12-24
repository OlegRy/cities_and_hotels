class Admin::BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :set_room, only: [:index, :new, :create]
  before_filter :authenticate_admin!, :except => [:show, :index]


  def booking

    @room = Room.find(params[:room_id])

    return if params[:date_start].nil? || params[:date_end].nil?

    date_start = Date.strptime(params[:date_start], '%d.%m.%Y')
    date_end   = Date.strptime(params[:date_end],   '%d.%m.%Y')


    while day <= date_end
      @days = @room.booked_for(day)
    end






#    @bookings = @room.bookings.where('date_start > ?', Time.now)

#    dates = []

#    @bookings.all.each { |b| dates << [b.date_start, b.date_end] }

#
#  [
#    [ Sat, 15 Nov 2014, Tue, 25 Nov 2014],
#    [ Thu, 27 Nov 2014, Sun, 30 Nov 2014]
#  ]



#    day = date_start

  #   @result = true

  #   while day < date_end do
  #     break unless @result
  #     dates.each do |range|
  #       range_start = range[0].to_date
  #       range_end   = range[1].to_date
  #       while range_start <= range_end do
  #         @result = false if day == range_start.to_date
  #         range_start += 1.days
  #       end
  #     end
  #     day += 1.days
  #   end
  end

  def index
    @bookings = @room.bookings.all
  end

  def show
  end

  def new
    @booking = @room.bookings.new
  end

  def edit
  end

  def create
    @booking = @room.bookings.new(booking_params)

    respond_to do |format|
      if @booking.save
        format.html { redirect_to admin_room_bookings_path(@room), notice: 'Booking was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to admin_room_bookings_path(@booking.room_id), notice: 'Booking was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @room = @booking.room
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to admin_room_bookings_path(@room), notice: 'Booking was successfully destroyed.' }
    end
  end

  private
    def set_booking
      @booking = Booking.find(params[:id])
    end

    def set_room
      @room = Room.find(params[:room_id])
    end

    def booking_params
      params.require(:booking).permit(:user_name, :date_start, :date_end)
    end
end
