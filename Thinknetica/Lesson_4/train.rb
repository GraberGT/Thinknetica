# frozen_string_literal: true

require_relative 'route'

class Train
  attr_reader :number, :type

  @@trains = {}

  def self.all
    @@trains
  end

  def initialize(number)
    @number = number
    @quantity_wagon = []
    @@trains[number] = self
  end

  def self.find(number)
    all[number]
  end

  def station_route(route)
    @route = route
    @current_station = @route.stations.first
    @current_station.join_train(self)
  end

  def add_wagon(wagon)
    return 'Error' if wagon.type != @type

    @amount_wagon << wagon
  end

  attr_reader :current_station

  def next_station
    @route.stations[current_station_index + 1]
  end

  def previous_station
    @route.stations[current_station_index - 1]
  end

  def go_tonext_station
    return if @current_station == @route.stations.last

    move(next_station)
  end

  def go_toback_station
    return if @current_station == @route.stations.first

    move(previous_station)
  end

  def current_station_index
    @route.stations.index(@current_station)
  end

  def move(station)
    return unless @current_station && @route

    @current_station.send_train(self)
    @current_station = station
    @current_station.join_train(self)
end
end