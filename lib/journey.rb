class Journey

  MIN_FARE = 1
  PEN_FARE = 6

  attr_reader :entry_station, :exit_station, :completed_journey, :fare

  def initialize(entry_station=nil)
    @entry_station = entry_station
    @completed_journey = {entry: nil, exit: nil}
    @fare = PEN_FARE
  end

  def complete_journey(station)
    @completed_journey = {entry: @entry_station, exit: station}
    decide_fare
    self
  end

  def decide_fare
    journey_is_not_valid? ? @fare = PEN_FARE : @fare = MIN_FARE
  end

  private

  def journey_is_not_valid?
    completed_journey[:exit].nil? || completed_journey[:entry].nil?
  end

end
