class BrandsController < ApplicationController
    before_action :redirect_if_not_logged_in?
    before_action :find_brand, only: [:show, :edit, :update, :destroy]

    def index
        @brands = Brand.all 
    end

    def show
        
    end


    def new
        @brand = Brand.new
        @brand.build_country
    end


    def create
        @brand = Brand.new(brand_params)
        if @brand.save
            redirect_to brands_path
        else
            render :new
        end
    end

    def edit
    
    end

    def update
        if @brand.valid?
            @brand.update(brand_params)
            redirect_to brand_path(@brand)
        else
            render :edit
        end
    end

    def destroy
        @brand.destroy
    end

    private

    def brand_params
        params.require(:brand).permit(:name, :year_created, :country_id, country_attributes: [:name])
    end

    def find_brand
        @brand = Brand.find_by_id(params[:id])
    end

end
