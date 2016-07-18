require 'spec_helper'
require_relative '../../../../apps/cms/controllers/contents/index'

RSpec.describe Cms::Controllers::Contents::Index do
  let(:action)  { described_class.new }
  let(:params)  { Hash[] }
  let(:attrs)   { { url: 'URL', title: 'TITLE', image_url: 'IMAGE_URL', description: 'DESCRIPTION', list: 'LIST' } }

  before do
    ContentRepository.clear
    @content = ContentRepository.create(Content.new(attrs))
  end

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq(200)
  end

  it 'exposes all contents' do
    action.call(params)
    expect(action.exposures[:contents]).to eq([@content])
  end
end
