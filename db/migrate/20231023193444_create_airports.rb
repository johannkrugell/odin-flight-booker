# frozen_string_literal: true

# Create Airports table
class CreateAirports < ActiveRecord::Migration[7.0]
  def change
    create_table :airports do |t|
      t.string :iata_code
      t.string :location
      t.string :name
      t.string :country

      t.timestamps
    end
  end
end
