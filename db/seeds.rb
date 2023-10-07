# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Airport.destroy_all
Flight.destroy_all
Passenger.destroy_all
Booking.destroy_all

# Create Airports
10.times do
  Airport.create(code: Array('A'..'Z').sample(3).join)
end

# Create Flights
3000.times do
  interval = rand(0..23).hours + rand(0..59).minutes + rand(0..59).seconds
  Flight.create(start: DateTime.now + rand(0..30), duration: interval, departure_airport_id: rand(1..10), arrival_airport_id: rand(1..10), seats: rand(1..80))
end

# Create Passengers
100.times do
  name = Array('a'..'z').sample(8).join
  email = "#{name}@#{Array('a'..'z').sample(5).join}.com"
  Passenger.create(name: name, email: email)
end

# Create Bookings
100.times do
  Booking.create(flight_id: rand(1..3000))
end

# Create bookings_passengers entries
100.times do
  random_booking_id = rand(1..100)
  random_passenger_amount = rand(1..4)
  random_passengers = []
  random_passenger_amount.times do
    random_passengers << Passenger.find(rand(1..100))
  end
  Booking.find(random_booking_id).passengers << random_passengers.uniq
end
