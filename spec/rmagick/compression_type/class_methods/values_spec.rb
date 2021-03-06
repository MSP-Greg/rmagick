RSpec.describe Magick::CompressionType, '.values' do
  it 'does not cause an infinite loop' do
    img = Magick::Image.new(1, 1)
    described_class.values do |value|
      img.compression = value
      expect(img.compression).to eq(value)
    end
  end
end
