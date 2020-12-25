# Write a function that takes an unsigned integer and returns the
# number of '1' bits it has (also known as the Hamming weight).

class HammingWeight
  def hamming_weight(n)
    count = 0
    while n > 0
      count += n & 1
      n >>= 1
    end

    count
  end
end

hw = HammingWeight.new
p hw.hamming_weight(111)
