class Station

  attr_reader :station_zone, :station_name

  def initialize(name, zone)
    @station_name = name
    @station_zone = zone
  end

end
