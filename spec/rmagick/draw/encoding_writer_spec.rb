RSpec.describe Magick::Draw, '#encoding=' do
  before do
    @draw = described_class.new
  end

  it 'works' do
    expect { @draw.encoding = 'AdobeCustom' }.not_to raise_error
    expect { @draw.encoding = 2 }.to raise_error(TypeError)
  end
end
