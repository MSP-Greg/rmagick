RSpec.describe Magick::Image, '#erase!' do
  before { @img = described_class.new(20, 20) }

  it 'works' do
    expect do
      res = @img.erase!
      expect(res).to be(@img)
    end.not_to raise_error
  end
end
