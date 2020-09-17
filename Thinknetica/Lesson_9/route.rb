# frozen_string_literal: true

require_relative 'instance_counter'
require_relative 'validate'

class Route
  include InstanceCounter
  include Validate

  attr_reader :stations

  def initialize(first_station, current_station, last_station)
    @first_st = first_station
    @current_st = current_station
    @last_st = last_station
    @stations = [@first_st, @current_st, @last_st]
    validate!(first_station, current_station, last_station)
  end

  protected

  def validate!(first_station, current_station, last_station)
    if first_station.class != Station || current_station.class != Station || last_station.class != Station
      raise 'One of the objects is not of a Station class'
    end
  end
end
