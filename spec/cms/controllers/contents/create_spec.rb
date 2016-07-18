require_relative '../../../../apps/cms/controllers/contents/create'

RSpec.describe Cms::Controllers::Contents::Create do
  let(:action) { described_class.new }
  let(:attrs)  { { url: 'URL', title: 'TITLE', image_url: 'IMAGE_URL', description: 'DESCRIPTION', list: 'LIST' } }
  let(:params) { Hash[content: attrs] }

  before { ContentRepository.clear }

  describe 'POST "/cms/contents"' do
    it 'creates a new content item' do
      action.call(params)
      # expect(action.content.id).to_not be_nil
      expect(action.content.url).to eq(attrs.fetch(:url))
    end

    it 'redirects the user to the contents index' do
      response = action.call(params)
      expect(response[0]).to eq(302)
      expect(response[1]['Location']).to eq('/cms/contents')
    end
  end
end
