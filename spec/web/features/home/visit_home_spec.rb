require 'features_helper'

RSpec.describe 'Visit homepage' do
  describe 'GET "/"' do
    it 'returns the homepage' do
      visit '/'
      within 'h1' do
        expect(page).to have_content('dynomail homepage')
      end
    end
  end
end
