RSpec.describe Magick::Image, "#charcoal" do
  def build_image(width:, height:, pixels:)
    image = Magick::Image.new(width, height)
    image.import_pixels(0, 0, width, height, "RGB", pixels.flatten)
  end

  def gray(pixel_value)
    [pixel_value, pixel_value, pixel_value]
  end

  before do
    @img = described_class.new(20, 20)
  end

  it "works" do
    expect do
      res = @img.charcoal
      expect(res).to be_instance_of(described_class)
    end.not_to raise_error
    expect { @img.charcoal }.not_to raise_error
    expect { @img.charcoal(1.0) }.not_to raise_error
    expect { @img.charcoal(1.0, 2.0) }.not_to raise_error
    expect { @img.charcoal(1.0, 2.0, 3.0) }.to raise_error(ArgumentError)
  end

  it "applies a charcoal effect", supported_after('6.8') do
    image = build_image(
      width: 2,
      height: 2,
      pixels: [[45, 98, 156], [209, 171, 11], [239, 236, 2], [8, 65, 247]]
    )

    expected_pixels = [gray(53736), gray(48703), gray(9953), gray(51857)]

    expect(image.charcoal).to match_pixels(expected_pixels, delta: 1)
  end
end
