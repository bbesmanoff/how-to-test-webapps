require_relative './spec_helper'

describe 'This Talk\'s Presentation' do
  let(:url) { 'https://bbesmanoff.github.io/how-to-test-webapps' }
  let(:gh_repo) { 'https://github.com/bbesmanoff/how-to-test-webapps' }
  let(:link_text) { 'bbesmanoff/how-to-test-webapps' }
  let(:right_arrow_selector) { '.navigate-right' }

  before :each do
    visit url
  end

  describe 'the repo link' do
    it 'should link to the repo' do
      click_link link_text

      expect(page.current_url).to eq gh_repo
    end
  end

  describe 'the right arrow' do
    describe 'using it to switch slides' do
      before :each do
        arrow = page.find :css, right_arrow_selector
        arrow.click
      end

      it 'should show the second slide' do
        current_slide = page.find :css, 'section.present'
        expect(current_slide.text).to eq 'WHO AM I?'
      end
    end
  end
end
