require 'features_helper'

RSpec.describe 'Visit content' do
  let(:attrs) { { url: 'URL', title: 'TITLE', image_url: 'IMAGE_URL', description: 'DESCRIPTION', list: 'LIST' } }
  before do
    ContentRepository.clear
    ContentRepository.create(Content.new(attrs))
  end

  describe 'visit "/cms"' do
    it 'renders a list of content' do
      visit '/cms'
      within '#content' do
        attrs.each do |key, value|
          expect(page).to have_content(value)
        end
      end
    end
  end
end
