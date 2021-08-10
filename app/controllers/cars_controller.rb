class CarsController < ApplicationController
    before_action :redirect_if_not_logged_in?

    def index
        if params[:brand_id] && @brand = Brand.find_by_id(params[:brand_id])
            @cars = @brand.cars
        else
            @cars = Car.all
        end
    end

    def show
        @car = Car.find_by_id(params[:id])
    end

    def new
        if params[:brand_id] && @brand = Brand.find_by_id(params[:brand_id])
            @car = Car.new(brand_id: params[:brand_id])
        else
            @car = Car.new
            b = @car.build_brand 
            b.build_country
        end
    end

    def create
        @car = Car.new(car_params)
        #byebug
        @car.user = current_user
        if @car.save
            redirect_to cars_path
        else
            render :new
        end

    end

    def edit
        @car = Car.find_by_id(params[:id])
    end

    def update
        @car = Car.find_by_id(params[:id])
        @car.update(car_params)
        if @car.valid?
            redirect_to car_path(@car)
        else
            render :edit
        end
    end

    def destroy
        @car = Car.find_by_id(params[:id])
        @car.destroy
        redirect_to cars_path
    end


    private

    def car_params
        params.require(:car).permit(:year, :model, :color, :brand_id, brand_attributes: [:name, :year_created, :country_id, country_attributes: [:name]])
    end


end
