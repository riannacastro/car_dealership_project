module CarsHelper
    def index_header_brand
    if @brand
        content_tag(:h1, "#{@brand.name} Cars: ")
        else
        content_tag(:h1, "All Cars:")
        end
    end
end

def form_header_brand
    if @brand
        content_tag(:h1, "Create #{@brand.name} Car: ")
        else
        content_tag(:h1, "Create Car:")
    end
end