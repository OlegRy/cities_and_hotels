class Admin::HotelsController < ApplicationController
  before_action :set_hotel, only: [:show, :edit, :update, :destroy]
  before_action :set_city, only: [:index, :create, :new]
  http_basic_authenticate_with name: "oleg", password: "ahsotiel1", except: [:index, :show]

  def index
    @hotels = @city.hotels
  end

  def show
  end

  def new
    @hotel = @city.hotels.new
  end

  def edit
  end

  def create
    @hotel = @city.hotels.new(hotel_params)

    respond_to do |format|
      if @hotel.save
        format.html { redirect_to admin_city_hotels_url(@hotel.city), notice: 'Hotel was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @hotel.update(hotel_params)
        format.html { redirect_to admin_city_hotels_url(@hotel.city), notice: 'Hotel was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @city = @hotel.city
    @hotel.destroy
    respond_to do |format|
      format.html { redirect_to admin_city_hotels_url(@city), notice: 'Hotel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_hotel
      @hotel = Hotel.find(params[:id])
    end

    def set_city
      @city = City.find(params[:city_id])
    end

    def hotel_params
      params.require(:hotel).permit(:name, :rating, :city_id)
    end
end
