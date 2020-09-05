# frozen_string_literal: true

class Wagon
  attr_reader :number

  def initialize(number)
    @number = number
  end
end

def create_wagon
  puts 'Enter 1 if passanger wagon, Enter 2 if cargo wagon'
  input = gets.strip

  puts 'Enter wagon number:'
  wagon_number = gets.to_i

  if input == '1'
    wagon = PassengerWagon.new(wagon_number)
    @wagons.push(wagon)
  elsif input == '2'
    wagon = CargoWagon.new(wagon_number)
    @wagons.push(wagon)
  end

  if wagon
    print input == '1' ? 'Passanger ' : 'Cargo '
    puts "Wagon number #{wagon_number} created"
  end

  def delete_wagon
    puts 'Enter number wagon'
    wagon = gets.chomp
    @wagons.delete(wagon)
  end
end