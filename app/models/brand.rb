class Brand < ApplicationRecord
    has_many :cars
    belongs_to :country
    validates :name, presence: true
    validates :year_created, presence: true

    def brand_details
        "#{self.name} - #{self.year_created}"
    end

end
