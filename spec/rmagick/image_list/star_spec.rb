RSpec.describe Magick::ImageList, '#*' do
  before do
    @list = described_class.new(*FILES[0..9])
  end

  it 'works' do
    @list.scene = 7
    cur = @list.cur_image
    expect do
      res = @list * 2
      expect(res).to be_instance_of(described_class)
      expect(res.length).to eq(20)
      expect(@list).not_to be(res)
      expect(res.cur_image).to be(cur)
    end.not_to raise_error

    expect { @list * 'x' }.to raise_error(ArgumentError)
  end
end
