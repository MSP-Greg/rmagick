RSpec.describe Magick::Image, '#unsharp_mask_channel' do
  before do
    @img = described_class.new(20, 20)
    @p = described_class.read(IMAGE_WITH_PROFILE).first.color_profile
  end

  it 'works' do
    expect do
      res = @img.unsharp_mask_channel
      expect(res).to be_instance_of(described_class)
    end.not_to raise_error

    expect { @img.unsharp_mask_channel(2.0) }.not_to raise_error
    expect { @img.unsharp_mask_channel(2.0, 1.0) }.not_to raise_error
    expect { @img.unsharp_mask_channel(2.0, 1.0, 0.50) }.not_to raise_error
    expect { @img.unsharp_mask_channel(2.0, 1.0, 0.50, 0.10) }.not_to raise_error
    expect { @img.unsharp_mask_channel(2.0, 1.0, 0.50, 0.10, Magick::RedChannel) }.not_to raise_error
    expect { @img.unsharp_mask_channel(2.0, 1.0, 0.50, 0.10, Magick::RedChannel, Magick::BlueChannel) }.not_to raise_error
    expect { @img.unsharp_mask_channel(2.0, 1.0, 0.50, 0.10, Magick::RedChannel, 2) }.to raise_error(TypeError)
    expect { @img.unsharp_mask_channel(2.0, 1.0, 0.50, 0.10, 2) }.to raise_error(TypeError)
    expect { @img.unsharp_mask_channel('x') }.to raise_error(TypeError)
    expect { @img.unsharp_mask_channel(2.0, 'x') }.to raise_error(TypeError)
    expect { @img.unsharp_mask_channel(2.0, 1.0, 'x') }.to raise_error(TypeError)
    expect { @img.unsharp_mask_channel(2.0, 1.0, 0.50, 'x') }.to raise_error(TypeError)
  end
end
