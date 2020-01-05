RSpec.describe Magick::ImageList, '#uniq' do
  before do
    @list = Magick::ImageList.new(*FILES[0..9])
    @list2 = Magick::ImageList.new # intersection is 5..9
    @list2 << @list[5]
    @list2 << @list[6]
    @list2 << @list[7]
    @list2 << @list[8]
    @list2 << @list[9]
  end

  it 'works' do
    expect { @list.uniq }.not_to raise_error
    expect(@list.uniq).to be_instance_of(Magick::ImageList)
    @list[1] = @list[0]
    @list.scene = 7
    list = @list.uniq
    expect(list.length).to eq(9)
    expect(list.scene).to eq(6)
    expect(@list.scene).to eq(7)
    @list[6] = @list[7]
    list = @list.uniq
    expect(list.length).to eq(8)
    expect(list.scene).to eq(5)
    expect(@list.scene).to eq(7)
  end
end