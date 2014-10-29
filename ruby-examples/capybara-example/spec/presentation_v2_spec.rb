require_relative './spec_helper'
require_relative './support/slideshow.rb'

describe 'This Presentation' do
  let(:url) { 'http://bbesmanoff.github.io/how-to-test-webapps/#/' }

  before :each do
    visit url

    @slideshow = Reveal::Slideshow.new url
  end

  describe 'the index page' do
    it 'should be the first slide' do
      expect(@slideshow.first?).to be_truthy
    end

    it 'should be treated as slide 0' do
      expect(@slideshow.current_slide).to be_zero
    end
  end

  describe 'going to the next slide' do
    before :each do
      @slideshow.next_slide
    end

    it 'should be on the second slide' do
      expect(@slideshow.text).to eq 'WHO AM I?'
    end

    it 'should reflect that in the slide counter' do
      expect(@slideshow.current_slide).to eq 1
    end
  end

  describe 'going to any slide' do
    before :each do
      @slideshow.goto_slide 5
    end

    it 'should go to that slide' do
      expect(@slideshow.current_slide).to eq 5
    end
  end
end

