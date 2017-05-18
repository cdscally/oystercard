require 'journey_log'

describe JourneyLog do

  subject(:journey_log) { described_class.new(:journey_class) }

  it 'knows a log of journeys' do
    expect(journey_log.journeys).to eq []
  end
end
