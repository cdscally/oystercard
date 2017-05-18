require 'journey_log'

describe JourneyLog do

  subject(:journey_log) { described_class.new(:journey_class) }

  it 'knows a log of journeys' do
    expect(journey_log.journeys).to eq []
  end

  it 'should be able to start a new journey with a new entry station' do
    journey_log.start(:entry_station)
    expect(journey_log.get_journey_start).to eq :entry_station
  end

  it 'should be able to finish a new journey with a new entry station' do
    journey_log.start(:entry_station)
    journey_log.finish(:exit_station)
    expect(journey_log.get_journey_finish).to eq :exit_station
  end
end
