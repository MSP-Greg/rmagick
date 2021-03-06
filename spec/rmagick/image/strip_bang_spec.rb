RSpec.describe Magick::Image, '#strip!' do
  before do
    @img = described_class.new(20, 20)
    @p = described_class.read(IMAGE_WITH_PROFILE).first.color_profile
  end

  it 'works' do
    expect do
      res = @img.strip!
      expect(res).to be(@img)
    end.not_to raise_error
  end
end
