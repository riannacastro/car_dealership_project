class Brand < ApplicationRecord
    has_many :cars
    has_many :users, through: :cars
    belongs_to :country
    validates :name, presence: true
    validates :year_created, presence: true
    accepts_nested_attributes_for :country

    def country_attributes=(hash_of_attributes)
        
        if !hash_of_attributes["name"].blank?
            @country = Country.new(hash_of_attributes)
            if !Country.find_by_name(@country.name)
                @country.save
            end
        end

    end

    def brand_details
        "#{self.name} - #{self.year_created}"
    end

end
