require 'capybara/dsl'
include Capybara::DSL

module Reveal
  class Arrow
    def initialize(direction)
      @arrow = page.find :css, ".navigate-#{direction}"
    end

    def press
      @arrow.click
    end

    def enabled?
      @arrow.has_css? '.enabled'
    end
  end
end
