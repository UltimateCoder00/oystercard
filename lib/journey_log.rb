require_relative 'journey'

class JourneyLog

  attr_reader :journeys, :current_journey

  def initialize
    @journeys = []
  end

  def start(entry_station)
    @current_journey = Journey.new(entry_station)
  end

  def finish(exit_station)
    @current_journey.update_exit_station(exit_station)
    @journeys << @current_journey.finish
  end

end
