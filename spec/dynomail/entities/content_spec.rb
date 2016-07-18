RSpec.describe Content do
  describe '.new(attrs)' do
    it 'initializes the entity with the attrs' do
      attrs   = { url: 'URL', title: 'TITLE', image_url: 'IMAGE_URL', description: 'DESCRIPTION', list: 'LIST' }
      content = Content.new(attrs)

      attrs.each do |k, v|
        expect(content.send(k)).to eq(v)
      end
    end
  end
end
