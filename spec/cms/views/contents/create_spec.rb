require_relative '../../../../apps/cms/views/contents/create'

RSpec.describe Cms::Views::Contents::Create do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Hanami::View::Template.new('apps/cms/templates/contents/create.html.erb') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #foo' do
    expect(view.foo).to eq exposures.fetch(:foo)
  end
end
