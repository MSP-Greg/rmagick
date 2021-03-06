RSpec.describe Magick::ImageList, '#<<' do
  before do
    @list = described_class.new(*FILES[0..9])
    @list2 = described_class.new # intersection is 5..9
    @list2 << @list[5]
    @list2 << @list[6]
    @list2 << @list[7]
    @list2 << @list[8]
    @list2 << @list[9]
  end

  it 'works' do
    expect do
      @list2.each { |img| @list << img }
      expect(@list.length).to eq(15)
      expect(@list.scene).to eq(14)
    end.not_to raise_error

    expect { @list << 2 }.to raise_error(ArgumentError)
    expect { @list << [2] }.to raise_error(ArgumentError)
  end
end
