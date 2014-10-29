require 'rspec'
require 'capybara/dsl'
require 'capybara/rspec'

include Capybara::DSL

Capybara.default_driver = :selenium
