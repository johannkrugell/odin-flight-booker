# frozen_string_literal: true

# Booking model, which represents a booking for a flight
class Booking < ApplicationRecord
  belongs_to :flight
  has_many :passengers, dependent: :destroy
  # Enable you to handle passenger attributes when creating or updating a booking.
  accepts_nested_attributes_for :passengers

  # Add delegate methods to access departure and arrival airports through the flight
  delegate :departure_airport, to: :flight
  delegate :arrival_airport, to: :flight

  # Validations
  validates :passengers, numericality: { greater_than: 0 }
end
