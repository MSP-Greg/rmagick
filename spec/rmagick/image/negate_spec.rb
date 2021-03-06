RSpec.describe Magick::Image, '#negate' do
  before { @img = described_class.new(20, 20) }

  it 'works' do
    expect do
      res = @img.negate
      expect(res).to be_instance_of(described_class)
      expect(res).not_to be(@img)
    end.not_to raise_error
    expect { @img.negate(true) }.not_to raise_error
    expect { @img.negate(true, 2) }.to raise_error(ArgumentError)
  end
end
