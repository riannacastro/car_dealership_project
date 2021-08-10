class Brand < ApplicationRecord
    has_many :cars
    has_many :users, through: :cars
    belongs_to :country
    validates :name, presence: true
    validates :year_created, presence: true
    accepts_nested_attributes_for :country

    def country_attributes=(hash_of_attributes)
        if !hash_of_attributes["name"].blank?
            self.country = Country.find_or_create_by(hash_of_attributes)
        end

    end

    def brand_details
        "#{self.name} - #{self.year_created}"
    end

end
