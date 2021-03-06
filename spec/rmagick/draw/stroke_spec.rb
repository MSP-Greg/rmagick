RSpec.describe Magick::Draw, '#stroke' do
  before do
    @draw = described_class.new
    @img = Magick::Image.new(200, 200)
  end

  it 'works' do
    @draw.stroke('red')
    expect(@draw.inspect).to eq('stroke "red"')
    @draw.rectangle(10, '10', 100, 100)
    expect { @draw.draw(@img) }.not_to raise_error

    # expect { @draw.stroke(100) }.to raise_error(ArgumentError)
  end
end
