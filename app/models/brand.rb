class Brand < ApplicationRecord
    has_many :cars
    belongs_to :country
end
