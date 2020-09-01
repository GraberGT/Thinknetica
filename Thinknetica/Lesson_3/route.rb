# frozen_string_literal: true

class Route
  attr_reader :stations

  def initialize(first_st, last_st)
    @first_st = first_st
    @last_st = last_st
    @stations = [@first_st, @last_st]
  end

  def add_station(station)
    return 'Error' if station == @station.first || @station.last

    @stations.insert(-2, station)
  end

  def delete_station(station)
    return 'Error' if station == @station.first || @station.last

    @stations.delete(station)
  end

  def show_route
    @stations
  end
end
