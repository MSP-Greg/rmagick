RSpec.describe Magick::Draw, '#ellipse' do
  before do
    @draw = described_class.new
    @img = Magick::Image.new(200, 200)
  end

  it 'works' do
    @draw.ellipse(50.5, 30, 25, 25, 60, 120)
    expect(@draw.inspect).to eq('ellipse 50.5,30 25,25 60,120')
    expect { @draw.draw(@img) }.not_to raise_error

    expect { @draw.ellipse('x', 20, 30, 40, 50, 60) }.to raise_error(ArgumentError)
    expect { @draw.ellipse(10, 'x', 30, 40, 50, 60) }.to raise_error(ArgumentError)
    expect { @draw.ellipse(10, 20, 'x', 40, 50, 60) }.to raise_error(ArgumentError)
    expect { @draw.ellipse(10, 20, 30, 'x', 50, 60) }.to raise_error(ArgumentError)
    expect { @draw.ellipse(10, 20, 30, 40, 'x', 60) }.to raise_error(ArgumentError)
    expect { @draw.ellipse(10, 20, 30, 40, 50, 'x') }.to raise_error(ArgumentError)
  end
end
