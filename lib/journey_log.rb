class JourneyLog
  attr_reader :journeys, :journey_class

  def initialize(journey_class)
    @journey_class = journey_class
    @journeys = []
  end

end
