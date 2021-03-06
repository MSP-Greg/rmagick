RSpec.describe Magick::Image, '#composite_affine' do
  before { @img = described_class.new(20, 20) }

  it 'works' do
    affine = Magick::AffineMatrix.new(1, 0, 1, 0, 0, 0)
    img1 = described_class.read(IMAGES_DIR + '/Button_0.gif').first
    img2 = described_class.read(IMAGES_DIR + '/Button_1.gif').first
    img1.define('compose:args', '1x1')
    img2.define('compose:args', '1x1')
    expect do
      res = img1.composite_affine(img2, affine)
      expect(res).to be_instance_of(described_class)
      expect(res).not_to be(@img)
    end.not_to raise_error
  end
end
