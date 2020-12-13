class PalindomeNumber
  def isPalindrome?(num)
    numcopy = num
    return false if num < 0
    return true if num < 10
    numcopy = num
    sum = 0
    while num > 0
      sum = sum*10 + num%10
      num = num/10
    end
    return sum == numcopy
  end
end

pn = PalindomeNumber.new
puts pn.isPalindrome?(12321)
