class Car < ApplicationRecord
    belongs_to :user
    belongs_to :brand
    accepts_nested_attributes_for :brand
    
    scope :order_by_year, -> {order(:year)}

    def brand_attributes=(hash_of_attributes)
        if !hash_of_attributes["name"].blank? && !hash_of_attributes["year_created"].blank?
            @brand = Brand.new(hash_of_attributes)
            if !Brand.find_by_name(@brand.name)
                @brand.save
            end
        end

    end



    

    validates :year, numericality: {greater_than: 1900, less_than: 2021}
    validates :color, :model, presence: true

    

    def car_details
    "#{self.year} #{self.model} - #{self.color}"
    end

end
