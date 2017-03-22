class Journey

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  attr_reader :entry_station, :exit_station

  def initialize(start = nil, finish = nil)
    @entry_station = start
    @exit_station = finish
  end

  def fare
    complete? ? MINIMUM_FARE : PENALTY_FARE
  end

  def complete?
    !!entry_station && !!exit_station
  end

end
