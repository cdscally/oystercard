class Oystercard
  attr_reader :balance, :in_use

  MAX_BALANCE = 90

  def initialize
    @balance = 0
    @in_use = false
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
  end
  

end
