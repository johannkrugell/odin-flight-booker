# frozen_string_literal: true

# Mailer to send confirmation email to passenger
class PassengerMailer < ApplicationMailer
  def confirmation_email(passenger)
    @passenger = passenger
    @url = 'http://example.com/login'
    mail(from: 'bookings@drongoairlines.com', to: @passenger.email, subject: 'Your booking is confirmed') do |format|
      format.html
      format.text
    end
  end
end
