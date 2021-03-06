RSpec.describe Magick::Image, '#vignette' do
  before do
    @img = described_class.new(20, 20)
    @p = described_class.read(IMAGE_WITH_PROFILE).first.color_profile
  end

  it 'works' do
    expect do
      res = @img.vignette
      expect(res).to be_instance_of(described_class)
      expect(@img).not_to be(res)
    end.not_to raise_error
    expect { @img.vignette(0) }.not_to raise_error
    expect { @img.vignette(0, 0) }.not_to raise_error
    expect { @img.vignette(0, 0, 0) }.not_to raise_error
    expect { @img.vignette(0, 0, 0, 1) }.not_to raise_error
    # too many arguments
    expect { @img.vignette(0, 0, 0, 1, 1) }.to raise_error(ArgumentError)
  end
end
