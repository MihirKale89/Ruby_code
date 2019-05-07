# @param {Integer} dividend
# @param {Integer} divisor
# @return {Integer}
def divide(dividend, divisor)
  sign = (dividend < 0) ^ (divisor < 0) ? -1 : 1
  dividend = dividend.abs
  divisor = divisor.abs
  quotient = 0
  temp = 1
  num = 1

  while dividend >= divisor
    temp = divisor
    num = 1
    while dividend > temp
      temp <<= 1
      num <<= 1
    end
    if dividend == temp
      quotient += num
      dividend = 0
    else
      quotient += num >> 1
      dividend -= temp >> 1
    end
  end

  if sign == -1
    return [quotient*-1, -2147483648].max
  else
    return [quotient, 2147483647].min
  end

  quotient
end

p divide(10,3)
p divide(7,-3)
p divide(-2147483648,-1)
