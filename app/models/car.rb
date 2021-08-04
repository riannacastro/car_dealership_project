class Car < ApplicationRecord
    belongs_to :user
    belongs_to :brand

    def car_details
    "#{self.year} #{self.model} - #{self.color}"
    end

end
