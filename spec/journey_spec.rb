require 'journey'

describe Journey do

  subject(:journey) { described_class.new(:station) }

  it 'should initialize with an entry station' do
    expect(journey.entry_station).to eq :station
  end

  it 'should have a minimum fare' do
    expect(!!Journey::MIN_FARE).to eq true
  end


  it 'should decide the fare' do
    journey.decide_fare
    expect(journey.fare).to eq Journey::PEN_FARE
  end

end
