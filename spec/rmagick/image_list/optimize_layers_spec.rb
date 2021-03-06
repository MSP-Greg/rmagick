RSpec.describe Magick::ImageList, "#optimize_layers" do
  before do
    @ilist = described_class.new
  end

  it "works" do
    @ilist.read(IMAGES_DIR + '/Button_0.gif', IMAGES_DIR + '/Button_1.gif')
    Magick::LayerMethod.values do |method|
      next if [Magick::UndefinedLayer, Magick::CompositeLayer, Magick::TrimBoundsLayer].include?(method)

      expect do
        res = @ilist.optimize_layers(method)
        expect(res).to be_instance_of(described_class)
        expect(res.length).to be_kind_of(Integer)
      end.not_to raise_error
    end

    expect { @ilist.optimize_layers(Magick::CompareClearLayer) }.not_to raise_error
    expect { @ilist.optimize_layers(Magick::UndefinedLayer) }.to raise_error(ArgumentError)
    expect { @ilist.optimize_layers(2) }.to raise_error(TypeError)
    expect { @ilist.optimize_layers(Magick::CompositeLayer) }.to raise_error(NotImplementedError)
  end
end
