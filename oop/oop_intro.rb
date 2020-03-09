class GoodDog
  attr_accessor :name

  def speak
    "#{@name} says arf!"
  end

  def initialize(name)
    @name = name
  end
end


sparky = GoodDog.new("Sparky")
puts sparky.speak
puts sparky.name
sparky.name = 'Spartacus'
puts sparky.name
