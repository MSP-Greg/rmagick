describe Magick::Image, '#preview' do
  it 'works' do
    hat = described_class.read(IMAGES_DIR + '/Flower_Hat.jpg').first
    expect do
      prev = hat.preview(Magick::RotatePreview)
      expect(prev).to be_instance_of(described_class)
    end.not_to raise_error
    Magick::PreviewType.values do |type|
      expect { hat.preview(type) }.not_to raise_error
    end
    expect { hat.preview(2) }.to raise_error(TypeError)
  end
end
