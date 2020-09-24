# frozen_string_literal: true

require_relative 'instance_counter'
require_relative 'validation'

class Station
  include InstanceCounter
  include Validation

  attr_reader :name, :trains

  validate :name, :presence
  validate :name, :type, type: String

  def initialize(name)
    @name = name
    @stations = []
    @trains = []
    validate!
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

  def list_trains
    trains.each { |train| yield train } if block_given?
  end

  def all
    @stations
  end

  protected

  def validate!
    raise 'Station name cannot be nil' if name.nil? || name.empty?
    raise 'Station name should have 1 or more characters' if name.to_s.empty?

    true
  end
end
