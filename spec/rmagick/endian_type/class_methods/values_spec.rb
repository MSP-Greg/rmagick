RSpec.describe Magick::EndianType, '.values' do
  it 'does not cause an infinite loop' do
    img = Magick::Image.new(1, 1)
    described_class.values do |value|
      img.endian = value
      expect(img.endian).to eq(value)
    end
  end
end
