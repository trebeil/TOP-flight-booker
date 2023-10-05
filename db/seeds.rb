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

10.times do
  Airport.create(code: Array('A'..'Z').sample(3).join)
end

10.times do
  interval = rand(0..23).hours + rand(0..59).minutes + rand(0..59).seconds
  Flight.create(start: DateTime.now + rand(-365..365), duration: interval, departure_airport_id: rand(1..10), arrival_airport_id: rand(1..10), seats: rand(1..80))
end

10.times do
  name = Array('a'..'z').sample(8).join
  email = "#{name}@#{Array('a'..'z').sample(5).join}.com"
  Passenger.create(name: name, email: email)
end

5.times do
  n1 = Array(1..10).sample(1).first
  n2 = Array(1..10).sample(1).first
  Flight.find(n1).passengers << Passenger.find(n2)
end
