require_relative '../../../../apps/cms/views/contents/new'

RSpec.describe Cms::Views::Contents::New do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Hanami::View::Template.new('apps/cms/templates/contents/new.html.haml') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #foo' do
    expect(view.foo).to eq exposures.fetch(:foo)
  end
end
