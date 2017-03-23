class Oystercard
  attr_reader :balance, :entry_station, :history

  CARD_LIMIT = 90
  MINIMUM_BALANCE = 1

  def initialize(limit = CARD_LIMIT)
    @balance = 0
    @entry_station = nil
    @history = []
  end

  def top_up(amount)
    raise "Cannot top-up card: Exceeds limit of £#{CARD_LIMIT}." if exceeds_limit?(amount)
    self.balance += amount
  end

  def touch_in(station)
    fail "Can't touch in, balance too low" if (self.balance < MINIMUM_BALANCE)
    self.entry_station = station
  end

  def touch_out(station)
    journey = Journey.new(entry_station, station)
    self.history.push(journey.finish)
    self.entry_station = nil
    deduct(journey.fare)
  end

  private
  attr_writer :balance, :entry_station, :history

  def exceeds_limit?(amount)
    self.balance + amount > CARD_LIMIT
  end

  def deduct(amount)
    self.balance -= amount
  end

end
