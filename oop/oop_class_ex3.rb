module Towable
  def can_tow(pounds)
    pounds < 2000 ? true : false
  end
end

class Vehicle

  attr_accessor :color, :model
  attr_reader :year

  @@number_of_vehicles = 0

  def self.mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas."
  end

  def initialize (year, model, color)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
    @mileage = 0
    @@number_of_vehicles += 1
  end

  def to_s
    puts "You have a #{year} #{color}, #{model}."
  end

  def speed_up(num)
    @current_speed += num
  end

  def break(num)
    @current_speed -= num
  end

  def shut_down
    @current_speed = 0
  end

  def info
    "#{year} #{color} #{model}"
  end

  def speedometer
    "#{@current_speed}"
  end

  def spray_paint(col)
    self.color = col
    puts "The car's color is now #{color}."
  end

  def self.number_of_vehicles
    puts "There are #{@@number_of_vehicles} vehicles right now."
  end

  def vehicle_age
    "The age of the vehicle is #{age_of_vehicle}."
  end

  private
  def age_of_vehicle
    Time.now.year - self.year
  end
end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4

end

car = MyCar.new(1994, 'blue', 'Honda')

truck = MyTruck.new(2000, 'black', "Chevy")

car = MyCar.new(1996, 'red', "Ford")

p Vehicle.number_of_vehicles

p Vehicle.ancestors
p MyTruck.ancestors
p MyCar.ancestors
p car.vehicle_age
