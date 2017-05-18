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
    expect(journey.complete_journey("B").completed_journey).to eq ({entry: "A", exit: "B"})
  end

  it 'should check for validity at #touch_in' do
    journey = Journey.new(:station)
    expect(journey).to be_in_journey
  end

  # it 'should deduct penalty fare if in journey on touch in' do
  #   expect(Oystercard.new.top_up(10).touch_in(:station).touch_in(:station).balance).to eq 4
  # end

  # it 'should deduct penalty fare if not in journey on touch out' do
  #   expect(Oystercard.new.top_up(10).touch_out(:station).balance).to eq 4
  # end


end
