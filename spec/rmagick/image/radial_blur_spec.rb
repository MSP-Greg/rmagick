RSpec.describe Magick::Image, '#radial_blur' do
  before do
    @img = described_class.new(20, 20)
    @p = described_class.read(IMAGE_WITH_PROFILE).first.color_profile
  end

  it 'works' do
    expect do
      res = @img.radial_blur(30)
      expect(res).to be_instance_of(described_class)
    end.not_to raise_error
  end
end
