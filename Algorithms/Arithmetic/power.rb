# Implement pow(x, n), which calculates x raised to the power n (i.e. xn).

class Power
  def my_pow(x, n)
    return 0 if x == 0
    return 1 if n == 0

    pow = n > 0 ? n : -n
    result =
      if pow.even?
        half = my_pow(x, pow / 2) # avoid calculating my_pow(x, pow/2) again
        half * half
      else
        half = my_pow(x, (pow - 1) / 2)
        half * half * x
      end

    n > 0 ? result : 1 / result
  end
end

p = Power.new
p p.my_pow(5, 2)
p p.my_pow(2, 5)
