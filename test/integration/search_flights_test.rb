# frozen_string_literal: true

# test/integration/search_flights_test.rb

require 'test_helper'

class SearchFlightsTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  def setup
    create_airports
    create_flights
  end

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end

  # Test to ensure that the search form is displayed on the home page
  test 'search flights' do
    visit root_path
    select @sydney.name, from: 'departure_airport_id'
    select @melbourne.name, from: 'arrival_airport_id'
    select 5.days.from_now.change(hour: 10 + (1 * 2)).strftime('%B %d, %Y'), from: 'start_datetime'
    select '1', from: 'passengers'
    click_on 'Search'

    assert_selector "[id^='flight_']", count: 3
  end

  # Test that the airports dropdown is populated with airports
  test 'airport dropdown is populated with airports' do
    visit flights_path

    within('form') do
      # Assuming your departure airport select has a label 'Departure airport'
      assert_selector('label[for="departure_airport_id"]')
      # This will find the select box and check all options against Airport records
      Airport.all.each do |airport|
        assert_selector('option', text: airport.name)
      end
    end
  end

  private

  def create_airports
    @sydney = Airport.create!(name: 'Sydney Airport', iata_code: 'SYD',
                              location: 'Sydney', country: 'Australia')
    @melbourne = Airport.create!(name: 'Melbourne Airport', iata_code: 'MEL',
                                 location: 'Melbourne', country: 'Australia')
  end

  def create_flights
    3.times do |i|
      Flight.create!(
        departure_airport: @sydney,
        arrival_airport: @melbourne,
        # just as an example: 10am, 12pm, 2pm
        start_datetime: 5.days.from_now.change(hour: 10 + (i * 2)).strftime('%B %d, %Y'),
        duration: 90
      )
    end
  end
end
