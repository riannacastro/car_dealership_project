module CarsHelper
    def index_header_brand
        if @brand
        content_tag(:h1, "#{@brand.name} Cars: ")
        else
        content_tag(:h1, "All Cars:")
        end
    end


    def form_header_brand
        if @brand
        content_tag(:h1, "Create #{@brand.name} Car: ")
        else
        content_tag(:h1, "Create Car:")
        end
    end

    def car_owner
        unless @car.user_id  == current_user
            redirect_to cars_path
        end
    end
end