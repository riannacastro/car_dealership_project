class Car < ApplicationRecord
    belongs_to :user
    belongs_to :brand
    accepts_nested_attributes_for :brand

    def brand_attributes=(hash_of_attributes)
        if !hash_of_attributes["name"].blank? && !hash_of_attributes["year_created"].blank?
            self.brand = Brand.find_or_create_by(hash_of_attributes)
        end
        
    end

    validates :year, presence: true, length: { is: 4 }
    validates :model, presence: true
    validates :color, presence: true

    def car_details
    "#{self.year} #{self.model} - #{self.color}"
    end

end
