# frozen_string_literal: true

class Route
  attr_reader :stations

  def initialize(first_station, current_station, last_station)
    @first_st = first_station
    @current_station = current_station
    @last_st = last_station
    @stations = [@first_st, @last_st]
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    @stations.delete(station)
  end
end