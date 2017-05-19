require_relative 'journey'

class JourneyLog
  attr_reader :journey_class, :journey, :current_journey

  def initialize(journey_class: Journey)
    @journey_class = journey_class
    @journeys = []
    @current_journey = {entry: nil, exit: nil}
  end

  def start(station)
    @journey = journey_class.new(station)
  end

  def complete_journey(station)
    @journey.exit_station = station
    @current_journey = {entry: @journey.entry_station, exit: station}
    record_journey
    @journey.decide_fare
    self
  end

  def journeys
    @journeys.dup
  end

  def reset_journey
    @journey = nil
    @current_journey = {entry: nil, exit: nil}
  end

  private

  def record_journey
    @journeys << @current_journey
  end

end
