class Admin::CitiesController < ApplicationController
  before_action :set_city, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with name: "oleg", password: "ahsotiel1", except: [:index, :show]

  def index
    @cities = City.all
  end

  def show
  end

  def new
    @city = City.new
  end

  def edit
  end

  def create
    @city = City.new(city_params)

    respond_to do |format|
      if @city.save
		  format.html { redirect_to admin_cities_path, notice: 'City was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @city.update(city_params)
        format.html { redirect_to admin_cities_url, notice: 'City was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @city.destroy
    respond_to do |format|
      format.html { redirect_to admin_cities_url, notice: 'City was successfully destroyed.' }
    end
  end

  private
    def set_city
      @city = City.find(params[:id])
    end

    def city_params
      params.require(:city).permit(:name)
    end
end
