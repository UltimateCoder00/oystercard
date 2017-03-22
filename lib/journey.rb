class Journey

  attr_reader :entry_station, :exit_station

  def initialize(start = nil, finish = nil)
    @entry_station = start
    @exit_station = finish
  end

  def complete?
    !!entry_station && !!exit_station
  end

end
