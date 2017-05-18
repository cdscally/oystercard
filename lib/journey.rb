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
    # @exit_station = station
    # @completed_journey[:entry] = @entry_station
    # @completed_journey[:exit] = station #@exit_station
    @completed_journey = {entry: @entry_station, exit: station}
    decide_fare
    self
  end

  def in_journey?
    !!self.entry_station
  end

  def decide_fare
    @fare = MIN_FARE
  end


end
