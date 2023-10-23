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
