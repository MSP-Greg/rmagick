RSpec.describe Magick::ImageList, '#unshift' do
  before do
    @list = described_class.new(*FILES[0..9])
  end

  it 'works' do
    img = @list[9]
    @list.scene = 7
    @list.unshift(img)
    expect(@list.scene).to eq(0)
    expect { @list.unshift(2) }.to raise_error(ArgumentError)
    expect { @list.unshift([1, 2]) }.to raise_error(ArgumentError)
  end
end
