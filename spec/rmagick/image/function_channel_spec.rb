RSpec.describe Magick::Image, '#function_channel' do
  before { @img = described_class.new(20, 20) }

  it 'works' do
    img = described_class.read('gradient:') { self.size = '20x600' }
    img = img.first
    img.rotate!(90)
    expect { img.function_channel Magick::PolynomialFunction, 0.33 }.not_to raise_error
    expect { img.function_channel Magick::PolynomialFunction, 4, -1.5 }.not_to raise_error
    expect { img.function_channel Magick::PolynomialFunction, 4, -4, 1 }.not_to raise_error
    expect { img.function_channel Magick::PolynomialFunction, -25, 53, -36, 8.3, 0.2 }.not_to raise_error

    expect { img.function_channel Magick::SinusoidFunction, 1 }.not_to raise_error
    expect { img.function_channel Magick::SinusoidFunction, 1, 90 }.not_to raise_error
    expect { img.function_channel Magick::SinusoidFunction, 5, 90, 0.25, 0.75 }.not_to raise_error

    expect { img.function_channel Magick::ArcsinFunction, 1 }.not_to raise_error
    expect { img.function_channel Magick::ArcsinFunction, 0.5 }.not_to raise_error
    expect { img.function_channel Magick::ArcsinFunction, 0.4, 0.7 }.not_to raise_error
    expect { img.function_channel Magick::ArcsinFunction, 0.5, 0.5, 0.5, 0.5 }.not_to raise_error

    expect { img.function_channel Magick::ArctanFunction, 1 }.not_to raise_error
    expect { img.function_channel Magick::ArctanFunction, 10, 0.7 }.not_to raise_error
    expect { img.function_channel Magick::ArctanFunction, 5, 0.7, 1.2 }.not_to raise_error
    expect { img.function_channel Magick::ArctanFunction, 15, 0.7, 0.5, 0.75 }.not_to raise_error

    # with channel args
    expect { img.function_channel Magick::PolynomialFunction, 0.33, Magick::RedChannel }.not_to raise_error
    expect { img.function_channel Magick::SinusoidFunction, 1, Magick::RedChannel, Magick::BlueChannel }.not_to raise_error

    # invalid args
    expect { img.function_channel }.to raise_error(ArgumentError)
    expect { img.function_channel 1 }.to raise_error(TypeError)
    expect { img.function_channel Magick::PolynomialFunction }.to raise_error(ArgumentError)
    expect { img.function_channel Magick::PolynomialFunction, [] }.to raise_error(TypeError)
    expect { img.function_channel Magick::SinusoidFunction, 5, 90, 0.25, 0.75, 0.1 }.to raise_error(ArgumentError)
    expect { img.function_channel Magick::ArcsinFunction, 0.5, 0.5, 0.5, 0.5, 0.1 }.to raise_error(ArgumentError)
    expect { img.function_channel Magick::ArctanFunction, 15, 0.7, 0.5, 0.75, 0.1 }.to raise_error(ArgumentError)
  end
end
