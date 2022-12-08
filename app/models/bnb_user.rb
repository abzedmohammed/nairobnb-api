class BnbUser < ApplicationRecord
    has_secure_password
    has_many :bnb_rooms
end
