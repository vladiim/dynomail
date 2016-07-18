require 'features_helper'

RSpec.describe 'Create content' do
  after { ContentRepository.clear }

  describe 'submit create content form' do
    it 'creates a new peice of content' do
      visit '/cms/contents/new'

      within 'form#content-form' do
        fill_in 'Url',        with: 'URL'
        fill_in 'Title',       with: 'TITLE'
        fill_in 'Description', with: 'DESCRIPTION'
        fill_in 'List',        with: 'LIST'
      end
    end
  end
end
