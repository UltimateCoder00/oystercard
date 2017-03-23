class Oystercard
  attr_reader :balance, :entry_station, :history

  CARD_LIMIT = 90
  MINIMUM_BALANCE = 1

  def initialize(limit = CARD_LIMIT)
    @balance = 0
    @entry_station = nil
    @journey_log = JourneyLog.new
  end

  def top_up(amount)
    raise "Cannot top-up card: Exceeds limit of £#{CARD_LIMIT}." if exceeds_limit?(amount)
    self.balance += amount
  end

  def touch_in(station)
    fail "Can't touch in, balance too low" if (self.balance < MINIMUM_BALANCE)
    self.entry_station = station
  end

  def touch_out(exit_station)
    @journey_log.start(entry_station)
    @journey_log.finish(exit_station)

    self.entry_station = nil
    deduct(@journey_log.current_journey.fare)
  end

  def card_history
    @journey_log.journeys
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
