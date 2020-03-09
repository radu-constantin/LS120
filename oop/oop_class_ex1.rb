class MyCar
  attr_accessor :color, :model
  attr_reader :year

  def self.mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas."
  end

  def to_s
    puts "You have a #{year} #{color}, #{model}."
  end

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @current_speed = 0
    @mileage = 0
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

end

car = MyCar.new(1994, 'blue', 'Honda')

puts car.info

puts car.speedometer

car.speed_up(40)

puts car.speedometer

car.break(15)

puts car.speedometer

puts MyCar.mileage(13, 351)

puts car.to_s
