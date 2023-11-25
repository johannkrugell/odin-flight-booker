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
      @booking.passengers.each do |passenger|
        confirmation_email_saved(passenger)
      end
      redirect_to booking_path(@booking), notice: 'Booking was successfully created.'
    else
      redirect_to @booking, notice: 'Booking could not be created.'
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def confirmation_email_saved(booking)
    # Tell the UserMailer to send a welcome email after save
    PassengerMailer.confirmation_email(booking).deliver_later
  end

  def confirmation_email_error
    redirect_to booking_path(@booking), notice: 'Confirmation email could not be sent.'
  end

  private

  def set_flight
    @flight = Flight.find(params[:flight_id])
  end

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: %i[id first_name surname email])
  end
end
