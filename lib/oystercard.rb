require_relative 'journey'
require_relative 'station'

class Oystercard
  attr_reader :balance, :entry_station, :journeys, :journey

  MAX_BALANCE = 90

  def initialize
    @balance = 0
    @entry_station = nil #kill
    @journeys = []
  end

  def top_up(top_up_value)
    fail "Maximum balance is £#{MAX_BALANCE}. You cannot top up more than £#{MAX_BALANCE-balance}." if (balance+top_up_value)>MAX_BALANCE
    @balance += top_up_value
    self
  end

  def touch_in(station)
    fail "Balance below minimum fare. Please top-up." if balance < Journey::MIN_FARE
    @in_journey = true
    @entry_station = station #kill
    @journey = Journey.new(station)
    self
  end

  def touch_out(station)
    @in_journey = false
    @journey.complete_journey(station)
    @journeys << @journey.completed_journey
    @entry_station = nil #kill
    deduct(Journey::MIN_FARE)
    self
  end

  def in_journey? #kill
    !!@entry_station
  end

  private

  def deduct(fare)
    @balance -= fare
    self
  end

end
