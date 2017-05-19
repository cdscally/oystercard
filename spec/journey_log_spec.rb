require 'journey_log'

describe JourneyLog do

  subject(:journey_log) { described_class.new }

  it 'knows a log of journeys' do
    expect(journey_log.journeys).to eq []
  end

  it 'can start a new journey' do
    journey_log.start(:station)
    expect(!!journey_log.journey).to eq true
  end

  it 'can complete a journey' do
    journey_log.start(:station)
    journey_log.complete_journey(:station)
    expect(journey_log.journeys).to eq [{entry: :station, exit: :station}]
  end

  it 'can rest a journey' do
    journey_log.start(:station)
    journey_log.reset_journey
    expect(!!journey_log.journey).to eq false
  end

end
