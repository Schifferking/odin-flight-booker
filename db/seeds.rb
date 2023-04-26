# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
codes = ['ATL', 'DFW', 'DEN', 'ORD', 'LAX', 'CLT', 'MCO', 'LAS', 'PHX', 'MIA',
         'SEA', 'IAH', 'JFK', 'EWR', 'FLL', 'MSP', 'SFO', 'DTW', 'BOS', 'SLC',
         'PHL', 'BWI', 'TPA', 'SAN', 'LGA', 'MDW', 'BNA', 'IAD', 'DCA', 'AUS']

codes.each do |c|
  Airport.create(code: c)
end
