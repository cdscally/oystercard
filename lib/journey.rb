class Journey

  MIN_FARE = 1
  PEN_FARE = 6

  attr_reader :entry_station, :fare
  attr_accessor :exit_station

  def initialize(entry_station=nil)
    @entry_station = entry_station
    @exit_station = nil
    @fare = PEN_FARE
  end

  def decide_fare
    journey_is_not_valid? ? @fare = PEN_FARE : @fare = MIN_FARE
  end

  private

  def journey_is_not_valid?
    (!entry_station || !exit_station)
  end

end
