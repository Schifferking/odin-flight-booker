# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# codes = ['ATL', 'DFW', 'DEN', 'ORD', 'LAX', 'CLT', 'MCO', 'LAS', 'PHX', 'MIA',
#         'SEA', 'IAH', 'JFK', 'EWR', 'FLL', 'MSP', 'SFO', 'DTW', 'BOS', 'SLC',
#         'PHL', 'BWI', 'TPA', 'SAN', 'LGA', 'MDW', 'BNA', 'IAD', 'DCA', 'AUS']

# codes.each do |c|
#  Airport.create(code: c)
# end

def different_numbers
  n1, n2 = rng_nums while same_number?(n1, n2)
  [n1, n2]
end

def rng_nums
  [rng(1, 30), rng(1, 30)]
end

def rng(start, finish)
  rand(start..finish)
end

def same_number?(num1, num2)
  num1 == num2
end

def random_start_duration
  rd = random_datetime

  # Create time object with day and hour from DateTime
  rt = Time.new(2023, 1, 1)
  # Random time between 40 minutes and 11 hours
  rt += rand(2400..39_600)
  [rd, rt]
end

def random_datetime
  DateTime.now + (rand * 365)
end

def delete_flight_records
  Flight.delete_all
end

delete_flight_records

50.times do |i|
  departure, arrival = different_numbers
  start_, duration_ = random_start_duration
  Flight.create(start: start_, duration: duration_, num_tickets: rng(1, 4),
                departure_airport_id: departure, arrival_airport_id: arrival)
end
