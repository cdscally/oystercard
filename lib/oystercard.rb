require_relative 'journey'
require_relative 'station'
require_relative 'journey_log'

class Oystercard
  attr_reader :balance, :journey, :journey_log

  MAX_BALANCE = 90

  def initialize(journey_log: JourneyLog.new)
    @journey_log = journey_log
    @balance = 0
  end

  def top_up(top_up_value)
    fail "Maximum balance is £#{MAX_BALANCE}. You cannot top up more than £#{MAX_BALANCE-balance}." if (balance+top_up_value)>MAX_BALANCE
    @balance += top_up_value
    self
  end

  def touch_in(station)
    fail "Balance below minimum fare. Please top-up." if balance < Journey::MIN_FARE
    touch_out(nil) if @journey_log.journey
    @journey_log.start(station)
    self
  end

  def touch_out(station)
    touch_in(nil) if !@journey_log.journey
    @journey_log.complete_journey(station)
    deduct
    @journey_log.reset_journey
    self
  end

  private

  def deduct
    @balance -= @journey_log.journey.fare
    self
  end

end
