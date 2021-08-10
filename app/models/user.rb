class User < ApplicationRecord
    has_secure_password
    has_many :cars
    has_many :brands, through: :cars
    validates :email, presence: true, uniqueness: true
end
