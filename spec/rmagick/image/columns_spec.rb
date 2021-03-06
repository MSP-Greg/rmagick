RSpec.describe Magick::Image, '#columns' do
  before do
    @img = described_class.new(100, 100)
  end

  it 'works' do
    expect { @img.columns }.not_to raise_error
    expect(@img.columns).to eq(100)
    expect { @img.columns = 2 }.to raise_error(NoMethodError)
  end
end
