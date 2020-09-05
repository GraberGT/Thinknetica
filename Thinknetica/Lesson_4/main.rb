# frozen_string_literal: true

require_relative 'station'
require_relative 'route'
require_relative 'passanger_train'
require_relative 'cargo_train'
require_relative 'passanger_wagon'
require_relative 'cargo_wagon'
require_relative 'train'
require_relative 'wagon'

class Main
  attr_reader :routes, :trains, :stations, :wagons

  def initialize
    @stations = []
    @routes = []
    @trains = []
    @wagons = []
  end

  def start
    loop do
      choise = choise_interface
      break if choise == '0'

      process_choise(choise)
    end
  end

  def choise_interface
    puts '1. Create station'
    puts '2. Create train'
    puts '3. Create wagon'
    puts '4. Delete wagon'
    puts '5. Create and manage route'
    puts '6. Delete station'
    puts '7  List station'
    puts '0. Exit'
    choise = gets.chomp.to_s
  end

  def process_choise(choise)
    case choise
    when '1'
      create_station
    when '2'
      create_train
    when '3'
      create_wagon
    when '4'
      delete_wagon
    when '5'
      create_and_manage_route
    when '6'
      delete_station
    when '7'
      stations
    end
  end

  def create_station
    p 'Enter Name Station'
    name = gets.chomp
    name = Station.new(name)
    @stations << name
  end

  def create_train
    puts 'Enter 1 if passanger, enter 2 if cargo'
    type = gets.to_i

    puts 'Enter train number'
    number = gets.to_i

    if type == 1
      train = PassengerTrain.new(number)
    elsif type == 2
      train = CargoTrain.new(number)
    end
    @trains.push(train)

    if train
      print type == 1 ? 'Passanger ' : 'Cargo '
      puts "Train number #{number} created"
    end
  end

  def create_and_manage_route
    loop do
      choise_2 = choise_interface_2
      break if choise_2 == '0'

      process_choise_2(choise_2)
    end
  end

  def choise_interface_2
    puts '1. Create route'
    puts '2. Add station'
    puts '3. Delete station'
    puts '0. Exit'
    choise_2 = gets.chomp.to_s
  end

  def process_choise_2(choise_2)
    case choise_2
    when '1'
      create_route
    when '2'
      add_station
    when '3'
      delete_station
    end
  end

  def create_route
    p 'Enter first station'
    first_st = gets.chomp.to_s
    p 'Enter current station station'
    current_st = gets.chomp.to_s
    p 'Enter last station'
    last_st = gets.chomp.to_s

    route = Route.new(first_st, current_st, last_st)
    @routes << route
    p @routes
  end

  def add_station
    puts 'Enter name station'
    station = gets.chomp.to_s
    @stations.insert(-2, station)
  end

  def delete_station
    puts 'Enter name station'
    station = gets.chomp.to_s
    @stations.delete(station)
  end

  def stations
    p @stations
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
  end

  def delete_wagon
    puts 'Enter number wagon'
    wagon = gets.chomp
    @wagons.delete(wagon)
  end
end

Main.new.start
