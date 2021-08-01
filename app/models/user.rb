class User < ApplicationRecord
    has_password_digest
    has_many :cars
end
