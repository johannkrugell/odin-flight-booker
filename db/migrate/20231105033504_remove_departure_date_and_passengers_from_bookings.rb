# frozen_string_literal: true

# Migration to remove departure_date and passengers from bookings
class RemoveDepartureDateAndPassengersFromBookings < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :departure_date
    remove_column :bookings, :passengers
  end
end
