RSpec.describe Magick::Image, '#negate_channel' do
  before { @img = described_class.new(20, 20) }

  it 'works' do
    expect do
      res = @img.negate_channel
      expect(res).to be_instance_of(described_class)
      expect(res).not_to be(@img)
    end.not_to raise_error
    expect { @img.negate_channel(true) }.not_to raise_error
    expect { @img.negate_channel(true, Magick::RedChannel) }.not_to raise_error
    expect { @img.negate_channel(true, Magick::RedChannel, Magick::BlueChannel) }.not_to raise_error
    expect { @img.negate_channel(true, Magick::RedChannel, 2) }.to raise_error(TypeError)
  end
end
