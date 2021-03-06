RSpec.describe Magick::Image, '#pixel_color' do
  before { @img = described_class.new(20, 20) }

  it 'works' do
    expect do
      res = @img.pixel_color(0, 0)
      expect(res).to be_instance_of(Magick::Pixel)
    end.not_to raise_error
    res = @img.pixel_color(0, 0)
    expect(res.to_color).to eq(@img.background_color)
    res = @img.pixel_color(0, 0, 'red')
    expect(res.to_color).to eq('white')
    res = @img.pixel_color(0, 0)
    expect(res.to_color).to eq('red')

    blue = Magick::Pixel.new(0, 0, Magick::QuantumRange)
    expect { @img.pixel_color(0, 0, blue) }.not_to raise_error
    # If args are out-of-bounds return the background color
    img = described_class.new(10, 10) { self.background_color = 'blue' }
    expect(img.pixel_color(50, 50).to_color).to eq('blue')

    expect do
      @img.class_type = Magick::PseudoClass
      res = @img.pixel_color(0, 0, 'red')
      expect(res.to_color).to eq('blue')
    end.not_to raise_error
  end

  it 'get/set CYMK color', supported_after('6.8.0') do
    img = described_class.new(20, 30) { self.quality = 100 }
    img.colorspace = Magick::CMYKColorspace

    pixel = Magick::Pixel.new
    pixel.cyan    = 49  * 257
    pixel.magenta = 181 * 257
    pixel.yellow  = 1   * 257
    pixel.black   = 183 * 257

    img.pixel_color(15, 20, pixel)

    temp_file_path = File.join(Dir.tmpdir, 'rmagick_pixel_color.jpg')
    img.write(temp_file_path)

    img2 = described_class.read(temp_file_path).first
    pixel = img2.pixel_color(15, 20)

    expect(pixel.cyan).to    equal(49  * 257)
    expect(pixel.magenta).to equal(181 * 257)
    expect(pixel.yellow).to  equal(1   * 257)
    expect(pixel.black).to   equal(183 * 257)

    File.delete(temp_file_path)
  end
end
