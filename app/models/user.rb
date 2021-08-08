class User < ApplicationRecord
    has_secure_password
    has_many :cars
    validates :email, presence: true, uniqueness: true
end
