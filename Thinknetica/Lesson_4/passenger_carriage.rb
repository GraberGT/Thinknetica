# frozen_string_literal: true

class PassengerCarriage
  attr_reader :carriage_number

  def initialize(carriage_number = rand(1..20))
    @carriage_number = carriage_number
  end
end
