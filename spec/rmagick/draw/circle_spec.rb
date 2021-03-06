RSpec.describe Magick::Draw, '#circle' do
  before do
    @draw = described_class.new
    @img = Magick::Image.new(200, 200)
  end

  it 'works' do
    @draw.circle(10, '20.5', 30, 40.5)
    expect(@draw.inspect).to eq('circle 10,20.5 30,40.5')
    expect { @draw.draw(@img) }.not_to raise_error

    expect { @draw.circle('x', 20, 30, 40) }.to raise_error(ArgumentError)
    expect { @draw.circle(10, 'x', 30, 40) }.to raise_error(ArgumentError)
    expect { @draw.circle(10, 20, 'x', 40) }.to raise_error(ArgumentError)
    expect { @draw.circle(10, 20, 30, 'x') }.to raise_error(ArgumentError)
  end
end
