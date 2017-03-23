class JourneyLog

  attr_reader :journeys, :current_journey

  def initialize
    @journeys = []
  end

  def start(entry_station)
    @current_journey = Journey.new(entry_station)

  end

end
