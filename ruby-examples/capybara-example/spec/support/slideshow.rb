require 'capybara/dsl'
include Capybara::DSL

require_relative './arrow'

module Reveal
  class Slideshow
    def initialize(url)
      @down_arrow = Reveal::Arrow.new 'down'
      @left_arrow = Reveal::Arrow.new 'left'
      @right_arrow = Reveal::Arrow.new 'right'
      @up_arrow = Reveal::Arrow.new 'up'

      @url = url
    end

    def content
      page.find :css, 'section.present'
    end

    def text
      content = page.find :css, 'section.present'
      content.text
    end

    def first?
      ! @left_arrow.enabled?
    end

    def last?
      ! @right_arrow.enabled?
    end

    def current_slide
      fragment = get_fragment
      parts = fragment.split /\//

      if parts.empty?
        0
      else
        parts[1].to_i
      end
    end

    def goto_slide(slide)
      new_url = @url + slide.to_s

      visit new_url
    end

    def next_slide
      @right_arrow.press
    end

    def retreat_slide
      @left_arrow.press
    end

    private

    def get_fragment
      url = page.current_url
      parts = url.split /#/

      parts.last
    end
  end
end
