RSpec.describe Magick::Draw, '#pointsize=' do
  before do
    @draw = described_class.new
  end

  it 'works' do
    expect { @draw.pointsize = 2 }.not_to raise_error
    expect { @draw.pointsize = 'x' }.to raise_error(TypeError)
  end
end
