# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

# Seed the airports table
# db/seeds.rb

australian_airports = [
  { location: "Adelaide", name: "Adelaide Airport", iata_code: "ADL" },
  { location: "Brisbane", name: "Brisbane Airport", iata_code: "BNE" },
  { location: "Broome", name: "Broome International Airport", iata_code: "BME" },
  { location: "Cairns", name: "Cairns Airport", iata_code: "CNS" },
  { location: "Canberra", name: "Canberra Airport", iata_code: "CBR" },
  { location: "Darwin", name: "Darwin International Airport", iata_code: "DRW" },
  { location: "Geelong", name: "Avalon Airport", iata_code: "AVV" },
  { location: "Gold Coast", name: "Gold Coast Airport", iata_code: "OOL" },
  { location: "Hobart", name: "Hobart Airport", iata_code: "HBA" },
  { location: "Melbourne", name: "Melbourne Airport", iata_code: "MEL" },
  { location: "Newcastle", name: "Newcastle Airport", iata_code: "NTL" },
  { location: "Perth", name: "Perth Airport", iata_code: "PER" },
  { location: "Port Hedland", name: "Port Hedland International Airport", iata_code: "PHE" },
  { location: "Sunshine Coast", name: "Sunshine Coast Airport", iata_code: "MCY" },
  { location: "Sydney", name: "Sydney Airport", iata_code: "SYD" },
  { location: "Townsville", name: "Townsville Airport", iata_code: "TSV" }
]

australian_airports.each do |airport|
  Airport.create!(
    location: airport[:location],
    name: airport[:name],
    iata_code: airport[:iata_code],
    country: "Australia"
  )
end

# Seed the flights table
# db/seeds.rb
# db/seeds.rb

# Let's fetch the Australian airports from the database
adelaide = Airport.find_by(iata_code: "ADL")
brisbane = Airport.find_by(iata_code: "BNE")
sydney = Airport.find_by(iata_code: "SYD")
melbourne = Airport.find_by(iata_code: "MEL")
broome = Airport.find_by(iata_code: "BME")
cairns = Airport.find_by(iata_code: "CNS")
canberra = Airport.find_by(iata_code: "CBR")
darwin = Airport.find_by(iata_code: "DRW")
geelong = Airport.find_by(iata_code: "AVV")
gold_coast = Airport.find_by(iata_code: "OOL")
hobart = Airport.find_by(iata_code: "HBA")
newcastle = Airport.find_by(iata_code: "NTL")
perth = Airport.find_by(iata_code: "PER")
port_hedland = Airport.find_by(iata_code: "PHE")
sunshine_coast = Airport.find_by(iata_code: "MCY")
townsville = Airport.find_by(iata_code: "TSV")

# Seeding the database for the next month 
# Calculate the start and end dates
start_date = Date.today
end_date = start_date + 1.month

# Seed flights (adjust as needed)
# Flight from Adelaide to Brisbane
Flight.create!(
  departure_airport_id: adelaide.id,
  arrival_airport_id: brisbane.id,
  start_datetime: DateTime.now + 3.days,
  duration: 120 # 2 hours, for example
)

# Generate flights daily three times per day for the next month
(start_date..end_date).each do |date|
  # Flights are at 8am, 12pm, and 6pm.
  [8, 12, 18].each do |hour|
    flight_time = DateTime.new(date.year, date.month, date.day, hour)
    
    # Flight from Sydney to Melbourne
    Flight.create!(
      departure_airport_id: sydney.id,
      arrival_airport_id: melbourne.id,
      start_datetime: flight_time,
      duration: 90 # 1.5 hours
    )

    # Flight from Adelaide to Brisbane
    Flight.create!(
      departure_airport_id: adelaide.id,
      arrival_airport_id: brisbane.id,
      start_datetime: flight_time,
      duration: 120 # 2 hours, for example
    )

    # Flight from Sydney to Perth
    Flight.create!(
      departure_airport_id: sydney.id,
      arrival_airport_id: perth.id,
      start_datetime: flight_time,
      duration: 300 # 5 hours, for example
    )

    # Flight from Melbourne to Perth
    Flight.create!(
      departure_airport_id: melbourne.id,
      arrival_airport_id: perth.id,
      start_datetime: flight_time,
      duration: 270 # 4.5 hours, for example
    )

    # Flight from Brisbane to Perth
    Flight.create!(
      departure_airport_id: brisbane.id,
      arrival_airport_id: perth.id,
      start_datetime: flight_time,
      duration: 270 # 4.5 hours, for example
    )

    # Flight from Brisbane to Sydney
    Flight.create!(
      departure_airport_id: brisbane.id,
      arrival_airport_id: sydney.id,
      start_datetime: flight_time,
      duration: 90 # 1.5 hours, for example
    )
  end
end

  # Generate flights daily once per day for the next month
(start_date..end_date).each do |date|
  # Flights are at 8am, 12pm, and 6pm.
  [15].each do |hour|
    flight_time = DateTime.new(date.year, date.month, date.day, hour)
    
    # Flight from Sydney to Central Coast
    Flight.create!(
      departure_airport_id: sydney.id,
      arrival_airport_id: gold_coast.id,
      start_datetime: flight_time,
      duration: 40 # 40 min
    )

    # Flight from Sydney to Canberra
    Flight.create!(
      departure_airport_id: sydney.id,
      arrival_airport_id: canberra.id,
      start_datetime: flight_time,
      duration: 60 # 1 hour
    )

    # Flight from Sydney to Newcastle
    Flight.create!(
      departure_airport_id: sydney.id,
      arrival_airport_id: newcastle.id,
      start_datetime: flight_time,
      duration: 40 # 40 min
    )

    # Flight from Sydney to Sunshine Coast
    Flight.create!(
      departure_airport_id: sydney.id,
      arrival_airport_id: sunshine_coast.id,
      start_datetime: flight_time,
      duration: 90 # 1.5 hours
    )
  end
end

