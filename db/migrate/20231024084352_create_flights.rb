# frozen_string_literal: true

# Create flights migration
class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.integer :departure_airport_id
      t.integer :arrival_airport_id
      t.datetime :start_datetime
      t.integer :duration

      t.timestamps
    end
  end
end
