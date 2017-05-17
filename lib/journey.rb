class Journey

  MIN_FARE = 1

  attr_reader :entry_station, :completed_journey

  def initialize(entry_station)
    @entry_station = entry_station
    @completed_journey = {}
  end

  def complete_journey(station)
    @completed_journey[:entry] = @entry_station
    @completed_journey[:exit] = station
    @completed_journey
  end
end
