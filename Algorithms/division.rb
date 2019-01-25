class Division
  def divide(dividend, divisor)
    isNegative = (dividend < 0) ^ (divisor < 0)
    dividend = dividend.abs
    divisor = divisor.abs
    result = 0
    negativeResult = 0
    while dividend >= divisor
      dividend -= divisor
      result += 1
    end
    if isNegative
      negativeResult = result
      2.times do
        negativeResult -= result
      end
    end
    return isNegative ? negativeResult : result
  end
end

d = Division.new
p d.divide(7, -3)
p d.divide(1, 1)
