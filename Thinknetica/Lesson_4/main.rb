# frozen_string_literal: true

require_relative 'train.rb'
require_relative 'route.rb'
require_relative 'passenger_carriage.rb'
require_relative 'cargo_carriage.rb'
require_relative 'passenger_train.rb'
require_relative 'cargo_train.rb'
require_relative 'station.rb'

class Main
  
  attr_reader :stations, :trains, :routes
  
  def initialize
    @stations = []
    @trains = []
    @routes = []
  end

  def main_menu
    loop do
      puts 'Enter \'1\' to create station.'
      puts 'Enter \'2\' to show_stations.'
      puts 'Enter \'3\' to create route.'
      puts 'Enter \'4\' to edit_route.'
      puts 'Enter \'5\' create_train.'
      puts 'Enter \'6\' train_actions.'
      puts 'Enter \'0\' to exit.'
      choice = gets.chomp.to_i

      break if choice.zero?

      case choice
      when 1 then create_station
      when 2 then show_stations
      when 3 then create_route
      when 4 then edit_route
      when 5 then create_train
      when 6 then train_actions
      when 0 then abort('Stop the program.')
      else puts 'It is not an option. Try again.'
      end
    end
  end

  def create_station
    puts 'Enter the station name'
    @stations << Station.new(gets.chomp.to_s)
  end

  def create_train
    puts 'Enter \'1\' to create passenger train.'
    puts 'Enter \'2\' to create cargo train.'
    input = gets.chomp.to_i
    case input
    when 1 then
      puts 'Enter number of train.'
      @trains << PassengerTrain.new(gets.chomp)
    when 2 then
      puts 'Enter number of train.'
      @trains << CargoTrain.new(gets.chomp)
    end
  end

  def create_route
    start_station = select_station('start station')
    end_station = select_station('end station')
    @routes << Route.new(start_station, end_station)
    puts @routes
  end
end

def edit_route_menu_options
    [
      '1 - add station',
      '2 - remove station'
    ]
  end

  def edit_route
    route = choiced_route
    render_options('route actions', edit_route_menu_options)
    case option_choice
    when 1 then route.add_station(select_station)
    when 2 then route.remove_station(select_station)
    end
  end


def train_actions_menu_options
    [
      '1 - set route',
      '2 - add wagon',
      '3 - remove wagon',
      '4 - move forward',
      '5 - move backward'
    ]
  end

 def train_actions
    if @trains.empty?
      print_error('Not a single train was created')
      return
    end

    train = choiced_train
    render_options('train actions', train_actions_menu_options)

    case option_choice
    when 1 then train.define_route(choiced_route)
    when 2 then train_add_wagon(train)
    when 3 then train.remove_wagon
    when 4 then train.forward
    when 5 then train.backward
    end
  end

def train_add_wagon(train)
    wagon = case train.type
            when 'passenger' then PassengerCarriage
            when 'cargo' then CargoCarriage
            end
    train.add_wagon(wagon.new)
  end
end

  def show_stations
    print_title('show stations')
    @stations.each do |station|
      print station.name + '. '
      station.show_trains
    end
  end