class Car
  attr_accessor :current_speed, :max_speed, :brand;

  def initialize(attributes = {})
    @current_speed  = 0
    @max_speed = 0
    @brand = "unknown"
  end

  def accelerate()
    if (@current_speed < @max_speed)
      @current_speed = @current_speed + 1
    end
  end

  def drive()
    while (@current_speed < @max_speed)
      accelerate()
      # puts "The speed of the car is #{@current_speed}"
    end
    if (@current_speed == @max_speed)
      puts "The car has hit it's maximum speed."
    end
  end
end

class Camaro < Car
  def initialize(attributes = {})
    @current_speed  = 0
    @max_speed = 200
    @brand = "Chevy"
  end
end

camaro = Camaro.new()
camaro.drive()
