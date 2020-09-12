# frozen_string_literal: true

require_relative 'wagon'

class CargoWagon < Wagon
  attr_reader :type, :volume, :load_volume

  def initialize(volume)
    @volume = volume
    @load_volume = 0
    @type = 'Cargo'
  end

  def load(volume)
    self.load_volume += volume if (load_volume + volume) <= volume
  end

  def free_volume
    volume - load_volume
  end
end
