# File:  simple_number.rb

class SimpleNumber
  def initialize(num)
    raise unless num.is_a?(Numeric)
    @x = num
  end

  def add(y)
    @x + y
  end

  def multiply(y)
    @x * y
  end

  def substract(y)
    @x - y
  end

  def divide(y)
    @x / y
  end
end
