class CarsController < ApplicationController
    before_action :redirect_if_not_logged_in?
    before_action :find_car, only: [:show, :update, :edit, :destroy]
    before_action :car_owner, only: [:edit, :update, :destroy]
    layout "car"

    def index
        if params[:brand_id] && @brand = Brand.find_by_id(params[:brand_id])
            @cars = @brand.cars
        else
            @cars = Car.order_by_year
        end
    end

    def show
        
    end

    def new
        if params[:brand_id] && @brand = Brand.find_by_id(params[:brand_id])
            @car = @brand.cars.build
        else
            @car = Car.new
            b = @car.build_brand 
            b.build_country
            
        end
    end

    def create
        @car = Car.new(car_params)
        
        @car.user = current_user
        if @car.save
            redirect_to cars_path
        else
            render :new
        end

    end

    def edit
        
    end

    def update
        @car.update(car_params)
        if @car.valid?
            redirect_to car_path(@car)
        else
            render :edit
        end
    end

    def destroy
        @car.destroy
        redirect_to cars_path
    end


    private

    def car_params
        params.require(:car).permit(:year, :model, :color, :brand_id, brand_attributes: [:name, :year_created, :country_id, country_attributes: [:name]])
    end

    def find_car
        @car = Car.find_by_id(params[:id])
    end
end
