class CarsController < ApplicationController
    before_action :redirect_if_not_logged_in?

    def index
        @cars = Car.all
    end

    def show
        @car = Car.find_by_id(params[:id])
    end

    def new
        @car = Car.new
        @car.build_brand
    end

    def create
        @car = Car.new(car_params)

        if @car.save
            redirect_to cars_path
        else
            render :new
        end

    end

    private

    def car_params
        params.require(:car).permit(:year, :model, :color, :brand_id, brand_attributes: [:name, :year_created])
    end


end
