class Animal
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def run
    'running!'
  end

  def jump
    'jumping!'
  end

  def fetch
    'fetching!'
  end
end


class Dog < Animal
end

class Cat < Animal
  def swim
    "can't swim!"
  end

  def fetch
    "can't fetch!"
  end
end


teddy = Dog.new
puts teddy.speak           # => "bark!"
puts teddy.swim           # => "swimming!"

karl = Bulldog.new
puts karl.speak
puts karl.swim
