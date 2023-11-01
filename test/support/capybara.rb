# frozen_string_literal: true

# test/support/capybara.rb

require 'capybara/rails'
require 'capybara/minitest'

Capybara.default_driver = :selenium_chrome_headless # Or :selenium for a browser view
