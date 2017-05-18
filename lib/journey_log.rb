require_relative 'journey'

class JourneyLog
  attr_reader :journeys, :journey_class

  def initialize(journey_class)
    @journey_class = journey_class
    @journeys = []
    @current_journey = {}
  end

  def start(station)
    @journey = Journey.new(station)
    current_journey[:entry]
  end

  def finish(station)
    @journey.complete_journey(station)
    @journey.completed_journey[:exit]
  end

  def current_journey
    @journey = Journey.new(nil) unless @journey
    @current_journey = {entry: @journey.entry_station, exit: nil}
  end

  # def get_journey_start
  #   @journey.entry_station
  # end
  #
  # def get_journey_finish
  #   @journey.completed_journey[:exit]
  # end

end
