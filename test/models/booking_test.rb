# frozen_string_literal: true

# Tests for the booking model

require 'test_helper'

class BookingTest < ActiveSupport::TestCase
  test 'booking should have 2 passengers' do
    assert @booking.passengers.size == 2
  end

  test 'booking should be associated with a flight' do
    @booking.flight_id = nil
    assert_not @booking.valid?
  end

  test 'booking should have a departure date' do
    @booking.flight.start_datetime = nil
    assert_not @booking.valid?
  end

  private

  def setup
    @flight = flights(:one)
    @booking = Booking.new(flight: @flight)
    2.times { @booking.passengers.build }
  end
end
