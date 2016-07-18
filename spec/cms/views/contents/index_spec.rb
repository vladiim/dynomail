require 'spec_helper'
require_relative '../../../../apps/cms/views/contents/index'

RSpec.describe Cms::Views::Contents::Index do
  let(:exposures) { Hash[contents: []] }
  let(:template)  { Hanami::View::Template.new('apps/cms/templates/contents/index.html.haml') }
  let(:view)      { Cms::Views::Contents::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #contents' do
    expect(view.contents).to eq(exposures.fetch(:contents))
  end

  context 'no content' do
    it 'shows a placeholder message' do
      expect(rendered).to include('There is no content yet.')
    end
  end

  context 'with content' do
    let(:attrs)    { { url: 'URL', title: 'TITLE', image_url: 'IMAGE_URL', description: 'DESCRIPTION', list: 'LIST' } }
    let(:content)  { Content.new(attrs) }
    let(:exposures) { Hash[contents: [content]]}

    it 'hides the placeholder' do
      expect(rendered).to_not include('There is no content yet.')
    end

    it 'displays the content' do
      expect(rendered).to include('URL')
      expect(rendered).to include('TITLE')
      expect(rendered).to include('DESCRIPTION')
    end
  end
end
