RSpec.describe Magick::Image, '#sample' do
  before do
    @img = described_class.new(20, 20)
    @p = described_class.read(IMAGE_WITH_PROFILE).first.color_profile
  end

  it 'works' do
    expect do
      res = @img.sample(10, 10)
      expect(res).to be_instance_of(described_class)
    end.not_to raise_error
    expect { @img.sample(2) }.not_to raise_error
    expect { @img.sample }.to raise_error(ArgumentError)
    expect { @img.sample(0) }.to raise_error(ArgumentError)
    expect { @img.sample(0, 25) }.to raise_error(ArgumentError)
    expect { @img.sample(25, 0) }.to raise_error(ArgumentError)
    expect { @img.sample(25, 25, 25) }.to raise_error(ArgumentError)
    expect { @img.sample('x') }.to raise_error(TypeError)
    expect { @img.sample(10, 'x') }.to raise_error(TypeError)
  end
end
