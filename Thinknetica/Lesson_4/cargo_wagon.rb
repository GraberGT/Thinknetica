# frozen_string_literal: true
require_relative 'wagon'

class CargoWagon < Wagon
  attr_reader :type

  def initialize(number)
    super(number)
    @type = "Cargo"
  end
end
