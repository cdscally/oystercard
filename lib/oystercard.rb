require_relative 'fare'

class Oystercard
  attr_reader :balance

  MAX_BALANCE = 90

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(top_up_value)
    fail "Maximum balance is £#{MAX_BALANCE}. You cannot top up more than £#{MAX_BALANCE-balance}." if (balance+top_up_value)>MAX_BALANCE
    @balance += top_up_value
    self
  end

  def deduct(fare)
    @balance -= fare
    self
  end

  def touch_in
    fail "Balance below minimum fare. Please top-up." if balance < Fare::MIN_FARE
    @in_journey = true
    self
  end

  def touch_out
    @in_journey = false
    self
  end

  def in_journey?
    @in_journey
  end

end
