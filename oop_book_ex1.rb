=begin
Create a class called MyCar. When you initialize a new instance or object of the class,
allow the user to define some instance variables that tell us the year, color, and model of the car.
Create an instance variable that is set to 0 during instantiation of the object to track the current speed of the car as well.
Create instance methods that allow the car to speed up, brake, and shut the car off.
=end

 class MyCar
   attr_accessor :color, :model
   attr_reader :year

   def initialize(y, c, m)
     @year = y
     @color = c
     @model = m
     @current_speed = 0
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

car.shut_down

puts car.speedometer

car.spray_paint('black')

puts car.year
