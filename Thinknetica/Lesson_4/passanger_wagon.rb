# frozen_string_literal: true


class Passanger_wagon
  attr_reader :pass_seats

  def initialize(pass_seats)
    @pass_seats = pass_seats
  end
end