# frozen_string_literal: true


require_relative 'station'
require_relative 'train'
require_relative 'passanger_wagon'

class Passanger_train < Train
  attr_reader :number, :amount_wagon

  def initialize(number)
    super(number)
    @amount_wagon = []
  end

  def add_wagon(wagon)
    return 'Error' if wagon.class != Passanger_wagon

    @amount_wagon << wagon
  end

  def delete_wagon(wagon)
    return 'Error' if wagon.class != Passanger_wagon

    @wagons_amount.delete(wagon)
  end
end