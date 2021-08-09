class Car < ApplicationRecord
    belongs_to :user
    belongs_to :brand
    accepts_nested_attributes_for :brand

    validates :year, presence: true, length: { is: 4 }
    validates :model, presence: true
    validates :color, presence: true

    def car_details
    "#{self.year} #{self.model} - #{self.color}"
    end

end
