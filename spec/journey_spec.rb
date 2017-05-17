require 'journey'

describe Journey do

  it 'should initialize with an entry station' do
    journey = Journey.new("ABC")
    expect(journey.entry_station).to eq "ABC"
  end

  it 'should have a minimum fare' do
    expect(!!Journey::MIN_FARE).to eq true
  end

  it 'should finish a journey' do
    journey = Journey.new("A")
    expect(journey.complete_journey("B")).to eq ({entry: "A", exit: "B"})
  end




end
