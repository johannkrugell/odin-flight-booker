# frozen_string_literal: true

require 'test_helper'

class BookingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @flight = flights(:one)
    @booking = bookings(:one)
  end

  test 'should get new' do
    get new_booking_url(flight_id: @flight.id)
    assert_response :success
  end

  test 'should create booking' do
    assert_difference('Booking.count') do
      post bookings_url,
           params: { booking: { flight_id: @flight.id,
                                passengers_attributes: [{ first_name: 'John', surname: 'Doe',
                                                          email: 'john@example.com' }] } }
    end

    assert_redirected_to booking_url(Booking.last)
  end

  test 'should show booking' do
    get booking_url(@booking)
    assert_response :success
  end
end
