class CarsController < ApplicationController

    def index
        @cars = Car.all
    end

    def show
        @car = Car.find_by_id(params[:id])
    end

    def new

    end

    def create
        
    end


end
