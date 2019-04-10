# @param {Integer} dividend
# @param {Integer} divisor
# @return {Integer}
def divide(dividend, divisor)
  sign = (dividend < 0) ^ (divisor < 0) ? -1 : 1
  dividend = dividend.abs
  divisor = divisor.abs
  quotient = 0;
  temp = 0;

  (31).downto(-1).each do |i|
    if (temp + (divisor << i) <= dividend)
      temp += divisor << i
      quotient |= 1 << i
    end
  end

  if sign == -1
    copy = quotient
    for i in 1..copy
      quotient -= 2
    end
  end

  quotient
end

p divide(10,3)
p divide(7,-3)      
