RSpec.describe Magick::ImageList, '#push' do
  before do
    @list = described_class.new(*FILES[0..9])
  end

  it 'works' do
    list2 = @list
    img1 = @list[0]
    img2 = @list[1]
    expect { @list.push(img1, img2) }.not_to raise_error
    expect(@list).to be(list2) # push returns self
    expect(@list.cur_image).to be(img2)
  end
end
