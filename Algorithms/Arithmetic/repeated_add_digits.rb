# Given a non-negative integer num, repeatedly add all its digits 
# until the result has only one digit.

class RepeatedAddDigits
  def repeated_add_digits(num)
    num.zero? ? 0 : 1 + (num - 1) % 9
  end
end

ad = RepeatedAddDigits.new
p ad.repeated_add_digits(73)
p ad.repeated_add_digits(105)
p ad.repeated_add_digits(99)
