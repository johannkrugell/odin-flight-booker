# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Destroy all existing records
Airport.destroy_all
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='airports';")

Flight.destroy_all
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='flights';")

# Seed the airports table
# This is a list of Australian airports, with their IATA codes
# Source: https://en.wikipedia.org/wiki/List_of_airports_in_Australia

australian_airports = [
  { location: 'Adelaide', name: 'Adelaide Airport', iata_code: 'ADL' },
  { location: 'Brisbane', name: 'Brisbane Airport', iata_code: 'BNE' },
  { location: 'Cairns', name: 'Cairns Airport', iata_code: 'CNS' },
  { location: 'Canberra', name: 'Canberra Airport', iata_code: 'CBR' },
  { location: 'Darwin', name: 'Darwin International Airport', iata_code: 'DRW' },
  { location: 'Gold Coast', name: 'Gold Coast Airport', iata_code: 'OOL' },
  { location: 'Hobart', name: 'Hobart Airport', iata_code: 'HBA' },
  { location: 'Melbourne', name: 'Melbourne Airport', iata_code: 'MEL' },
  { location: 'Perth', name: 'Perth Airport', iata_code: 'PER' },
  { location: 'Sydney', name: 'Sydney Airport', iata_code: 'SYD' }
]

australian_airports.each do |airport|
  Airport.create!(
    location: airport[:location],
    name: airport[:name],
    iata_code: airport[:iata_code],
    country: 'Australia'
  )
end

# Seed the flights table
# Create array of airports
airports = Airport.all.to_a

# Calculate the start and end dates
start_date = Date.today
end_date = start_date + 1.month

# Initialize the counter
flight_counter = 0

# Generate flights daily three times per day for the next month
(start_date..end_date).each do |date|
  # Flights are at 8am, 12pm, and 6pm.
  flight_times = [8, 12, 18].map { |hour| DateTime.new(date.year, date.month, date.day, hour) }

  # Loop over each combination of departure and arrival airports
  airports.combination(2).each do |departure_airport, arrival_airport|
    # Loop over each flight time for the current date
    flight_times.each do |flight_time|
      # Create a flight for each time
      Flight.create!(
        departure_airport_id: departure_airport.id,
        arrival_airport_id: arrival_airport.id,
        start_datetime: flight_time,
        duration: rand(60..180) # Random duration between 1 to 3 hours
      )
      # Increment the counter
      flight_counter += 1
    end
  end
end

puts "Created #{flight_counter} flights"
