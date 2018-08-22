class IntegerReverse
  def revInt(num)
    isNegative = num < 0 ? true : false
    num *= -1 if isNegative
    sum = 0
    while num > 0
      sum = sum*10 + num%10
      num = num/10
    end
    return isNegative ? sum * -1 : sum
  end
end

ir = IntegerReverse.new
puts ir.revInt(-98765)
puts ir.revInt(4321)
puts ir.revInt(1234)
