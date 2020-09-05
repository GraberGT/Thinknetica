class Route
  
  attr_reader :stations

  def initialize(first_st, last_st)
    @first_st = first_st
    @last_st = last_st
    @stations = [@first_st, @last_st]
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    @stations.delete(station)
  end

  def show_route
    @stations
  end

end