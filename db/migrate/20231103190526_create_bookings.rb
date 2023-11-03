# frozen_string_literal: true

# Booking model, which represents a booking for a flight
class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :flight, null: false, foreign_key: true
      t.date :departure_date, null: false
      t.integer :passengers, null: false

      t.timestamps
    end
  end
end
