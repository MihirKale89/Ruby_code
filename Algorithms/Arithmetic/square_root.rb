# Computing the square root of non-negative integer x.

class SquareRoot
  def my_sqrt(x)
    r = x
    r = (r + x / r) / 2 while r * r > x
    r
  end
end

sqrt = SquareRoot.new
p sqrt.my_sqrt(9)
p sqrt.my_sqrt(16)
