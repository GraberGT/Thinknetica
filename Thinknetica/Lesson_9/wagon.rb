# frozen_string_literal: true

require_relative 'manufacturer'
require_relative 'instance_counter'
require_relative 'validate'

class Wagon
  include Manufacturer
  include InstanceCounter
  include Validate

  attr_reader :number

  def initialize(number)
    @number = number
    validate!
  end

  protected

  def validate!
    raise 'Number cannot be nil' if number.nil?
    raise 'Number must be a positive number and greater than 0' if number < 1

    true
  end
end
