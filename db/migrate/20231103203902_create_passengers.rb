# frozen_string_literal: true

# Passenger model, which represents a passenger on a flight
class CreatePassengers < ActiveRecord::Migration[7.0]
  def change
    create_table :passengers do |t|
      t.string :first_name
      t.string :surname
      t.string :email
      t.references :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
