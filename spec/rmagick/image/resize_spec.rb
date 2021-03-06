RSpec.describe Magick::Image, '#resize' do
  before do
    @img = described_class.new(20, 20)
    @p = described_class.read(IMAGE_WITH_PROFILE).first.color_profile
  end

  it 'works' do
    expect do
      res = @img.resize(2)
      expect(res).to be_instance_of(described_class)
    end.not_to raise_error
    expect { @img.resize(50, 50) }.not_to raise_error

    Magick::FilterType.values do |filter|
      expect { @img.resize(50, 50, filter) }.not_to raise_error
    end
    expect { @img.resize(50, 50, Magick::PointFilter, 2.0) }.not_to raise_error
    expect { @img.resize('x') }.to raise_error(TypeError)
    expect { @img.resize(50, 'x') }.to raise_error(TypeError)
    expect { @img.resize(50, 50, 2) }.to raise_error(TypeError)
    expect { @img.resize(50, 50, Magick::CubicFilter, 'x') }.to raise_error(TypeError)
    expect { @img.resize(-1.0) }.to raise_error(ArgumentError)
    expect { @img.resize(0, 50) }.to raise_error(ArgumentError)
    expect { @img.resize(50, 0) }.to raise_error(ArgumentError)
    expect { @img.resize(50, 50, Magick::SincFilter, 2.0, 'x') }.to raise_error(ArgumentError)
    expect { @img.resize }.to raise_error(ArgumentError)
  end
end
