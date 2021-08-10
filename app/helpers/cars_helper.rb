module CarsHelper
    def index_header_brand
    if @brand
        content_tag(:h1, "#{@brand.name} Cars: ")
        else
        content_tag(:h1, "All Cars:")
        end
    end
end