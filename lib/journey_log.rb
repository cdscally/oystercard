require_relative 'journey'

class JourneyLog
  attr_reader :journeys, :journey_class

  def initialize(journey_class)
    @journey_class = journey_class
    @journeys = []
  end

  def start(station)
    @journey = Journey.new(station)
    @journey.entry_station
  end

  def finish(station)
    @journey.complete_journey(station)
    @journey.completed_journey[:exit]
  end

  # def get_journey_start
  #   @journey.entry_station
  # end
  #
  # def get_journey_finish
  #   @journey.completed_journey[:exit]
  # end

end
