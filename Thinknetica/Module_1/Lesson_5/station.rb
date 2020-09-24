# frozen_string_literal: true

require_relative 'instance_counter'

class Station
  include InstanceCounter

  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @stations = []
    @trains = []
    @stations << self
  end

  class << self
    attr_reader :stations
  end

  def add_train(train)
    @trains << train
  end

  def trains_type(type)
    @trains.select { |train| train.type == type }
  end

  def send_train(train)
    @trains.delete(train)
  end

  def all
    @stations
  end
end
