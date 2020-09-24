# frozen_string_literal: true

require_relative 'manufacturer'
require_relative 'instance_counter'
require_relative 'validate'

class Train
  include InstanceCounter
  include Manufacturer
  include Validate

  attr_reader :number, :type, :wagon

  def initialize(number)
    @number = number
    @wagons = []
    validate!
  end

  def station_route(route)
    @route = route
    @current_st = @route.stations.first
    @current_st.add_train(self)
  end

  def add_wagon(wagon)
    return 'Error' if wagon.type != @type

    @wagons << wagon
  end

  def delete_wagon(wagon)
    @wagons.delete(wagon)
  end

  attr_reader :current_station

  def next_station
    @route.stations[current_st_index + 1]
  end

  def previous_station
    @route.stations[current_st_index - 1]
  end

  def go_tonext_station
    return if @current_st == @route.stations.last

    move(first_st)
  end

  def go_toback_station
    return if @current_st == @route.stations.first

    move(last_st)
  end

  def current_station_index
    @route.stations.index(@current_st)
  end

  def move(station)
    return unless @current_st && @route

    @current_st.send_train(self)
    @current_st = station
    @current_st.add_train(self)
  end

  class << self
    attr_reader :trains

    def find(number)
      @trains[number]
    end
  end

  protected

  NUMBER_FORMAT = /^[a-z\d]{3}-?[a-z\d]{2}$/i.freeze
  def validate!
    raise 'Number cannot be nil' if number.nil?
    raise 'Number must be at least 5 characters' if number.to_s.length < 5

    if number !~ NUMBER_FORMAT
      raise "Number must have 3 letters and/or numbers,
             hypen(optional) and 2 letters and/or numbers"
    end
    true
  end
end
