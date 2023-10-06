class Passenger < ApplicationRecord
  has_many :flights, through: :bookings
  has_and_belongs_to_many :bookings
end
