class Oystercard
  attr_reader :balance

  MAX_BALANCE = 90

  def initialize
    @balance = 0
  end

  def top_up(top_up_value)
    @balance += top_up_value
    self
  end

end
