class BrandsController < ApplicationController

    def index
        @brands = Brand.all 
    end

    def new
        @brand = Brand.new
        @brand.build_country
    end


end
