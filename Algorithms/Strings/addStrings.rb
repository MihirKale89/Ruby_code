=begin

Given two non-negative integers num1 and num2 represented as string, return the
sum of num1 and num2.

Note:

The length of both num1 and num2 is < 5100.
Both num1 and num2 contains only digits 0-9.
Both num1 and num2 does not contain any leading zero.
You must not use any built-in BigInteger library or convert the inputs
to integer directly.

=end

class AddStrings
  def add_strings(num1, num2)
    max_length = num2.length > num1.length ? num2.length : num1.length
    sum = ""
    carry = 0
    for i in 0...max_length
        n1 = num1.length-1-i >= 0 ? num1[num1.length-1-i].to_i : 0
        n2 = num2.length-1-i >= 0 ? num2[num2.length-1-i].to_i : 0
        sum = ((n1+n2+carry)%10).to_s + sum
        p n1
        p n2
        p carry
        p sum
        carry = (n1+n2+carry)/10
    end
    sum = carry.to_s + sum if carry > 0
    sum
  end
end

as = AddStrings.new
p as.add_strings('0','9')
