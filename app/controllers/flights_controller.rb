# frozen_string_literal: true

# Controller for the flights resource
class FlightsController < ApplicationController
  before_action :set_airports, only: [:index]
  before_action :set_available_dates, only: [:index]

  def index
    # Initialize an empty ActiveRecord_Relation for flights
    @flights = Flight.none

    # If search parameters are present, filter the flights
    return unless search_params_present?

    search_flights

    set_selections
  end

  private

  # Helper method to determine if search parameters are present
  def search_params_present?
    params[:departure_airport_id].present? &&
      params[:arrival_airport_id].present? &&
      params[:start_datetime].present?
  end

  # Perform the search based on the provided parameters
  def search_flights
    start_datetime = DateTime.parse(params[:start_datetime]).beginning_of_day
    end_datetime = start_datetime.end_of_day

    @flights = Flight.where(
      departure_airport_id: params[:departure_airport_id],
      arrival_airport_id: params[:arrival_airport_id],
      start_datetime: start_datetime..end_datetime
    )
  end

  # Fetch all airports for the select dropdowns
  def set_airports
    @airports = Airport.all.order(:name)
  end

  # Fetch all unique start dates for which there are flights
  def set_available_dates
    @available_dates = Flight.order(:start_datetime).pluck(:start_datetime).map(&:to_date).uniq
  end

  # Get the current selections from the parameters
  def set_selections
    @selected_departure_airport_id = params[:departure_airport_id]
    @selected_arrival_airport_id = params[:arrival_airport_id]
    @selected_start_datetime = params[:start_datetime]
    @selected_passengers = params[:passengers]
  end
end
