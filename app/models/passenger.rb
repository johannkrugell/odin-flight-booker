# frozen_string_literal: true

# Passenger model, to be used in the booking form
class Passenger < ApplicationRecord
  belongs_to :booking
  # Validations
  validates :first_name, :surname, :email, presence: true
end
