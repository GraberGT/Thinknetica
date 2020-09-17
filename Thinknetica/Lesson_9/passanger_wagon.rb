# frozen_string_literal: true

require_relative 'wagon'

class PassengerWagon < Wagon
  attr_reader :type, :take_seats, :pass_seats
  def initialize(pass_seats)
    @pass_seats = pass_seats
    @take_seats = 0
    @type = 'Passenger'
  end

  def take_st
    self.take_seats += 1 if take_seats < pass_seats
  end

  def vacant_st
    pass_seats - take_seats
  end
end
