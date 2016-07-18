require_relative '../../../../apps/cms/controllers/contents/new'

RSpec.describe Cms::Controllers::Contents::New do
  let(:action) { described_class.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 200
  end
end
