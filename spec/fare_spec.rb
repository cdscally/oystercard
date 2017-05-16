require 'fare'

describe Fare do

  it 'should have a minimum' do
    expect(!!Fare::MIN_FARE).to eq true
  end

end
