class Brand < ApplicationRecord
    has_many :cars
    belongs_to :country
    validates :name, presence: true
    validates :year_created, presence: true
end
