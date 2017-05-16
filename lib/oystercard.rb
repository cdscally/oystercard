require_relative 'fare'

class Oystercard
  attr_reader :balance, :entry_station

  MAX_BALANCE = 90

  def initialize
    @balance = 0
    @entry_station = nil
  end

  def top_up(top_up_value)
    fail "Maximum balance is £#{MAX_BALANCE}. You cannot top up more than £#{MAX_BALANCE-balance}." if (balance+top_up_value)>MAX_BALANCE
    @balance += top_up_value
    self
  end

  def touch_in(station)
    fail "Balance below minimum fare. Please top-up." if balance < Fare::MIN_FARE
    @in_journey = true
    @entry_station = station
    self
  end

  def touch_out
    @in_journey = false
    @entry_station = nil
    deduct(Fare::MIN_FARE)
    self
  end

  def in_journey?
    !!@entry_station
  end

  private

  def deduct(fare)
    @balance -= fare
    self
  end

end
