# frozen_string_literal: true

class Route
  attr_reader :stations

  def initialize(first_station, current_station, last_station)
    @first_st = first_station
    @current_st = current_station
    @last_st = last_station
    @stations = [@first_st, @current_st, @last_st]
  end
end
