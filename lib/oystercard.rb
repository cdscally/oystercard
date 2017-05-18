require_relative 'journey'
require_relative 'station'

class Oystercard
  attr_reader :balance, :journeys, :journey

  MAX_BALANCE = 90

  def initialize
    @balance = 0
    @journeys = []
  end

  def top_up(top_up_value)
    fail "Maximum balance is £#{MAX_BALANCE}. You cannot top up more than £#{MAX_BALANCE-balance}." if (balance+top_up_value)>MAX_BALANCE
    @balance += top_up_value
    self
  end

  def touch_in(station)
    fail "Balance below minimum fare. Please top-up." if balance < Journey::MIN_FARE
    touch_out(nil) if @journey
    @journey = Journey.new(station)
    self
  end

  def touch_out(station)
    # touch_in(nil) if !@journey
    # @journey = Journey.new(nil) if not @journey
    @journey.complete_journey(station)
    record_journey(@journey)
    # @journey.completed_journey[:entry] == nil ? deduct(Journey::PEN_FARE) : deduct(Journey::MIN_FARE)
    # @journey = nil
    reset_journey(@journey)
    self
  end

  # def in_journey? #kill
  #   !!@journey
  # end

  private

  def deduct
    @balance -= journey.fare
    self
  end

  def record_journey(journey)
    @journeys << journey.completed_journey
    deduct
  end

  def reset_journey(journey)
    @journey = nil
  end

end
