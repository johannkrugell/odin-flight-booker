# frozen_string_literal: true

require 'test_helper'

# Unit tests for the FlightsController
class FlightsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get flights_path
    assert_response :success
  end
end
