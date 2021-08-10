class BrandsController < ApplicationController

    def index
        @brands = Brand.all 
    end

    def

    def new
        @brand = Brand.new

    end


end
