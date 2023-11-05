# frozen_string_literal: true

# Controller for the bookings model
class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    # adds the flight to the booking
    @booking = @flight.bookings.build
    # creates a number of passengers based on the number of passengers selected
    params[:num_passengers].to_i.times { @booking.passengers.build }
  end

  def create
    # finds the flight number in the booking params
    @flight = Flight.find(booking_params[:flight_id])
    @booking = @flight.bookings.build(booking_params)

    if @booking.save
      redirect_to booking_path(@booking), notice: 'Booking was successfully created.'
    else
      redirect_to @booking, notice: 'Booking could not be created.'
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def set_flight
    @flight = Flight.find(params[:flight_id])
  end

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: %i[id first_name surname email])
  end
end
