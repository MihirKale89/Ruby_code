class TwoSum
  def twoSumExists?(arr, sum)
    uniqueElements = Hash.new
    exists = false
    arr.each.map { |num|
      if uniqueElements[sum - num]
        exists = true
        break
      else
        uniqueElements[num] = num
      end
    }
    return exists
  end
end

ts = TwoSum.new
puts ts.twoSumExists?([1,2,3,9], 8)
puts ts.twoSumExists?([1,2,4,4], 8)
puts ts.twoSumExists?([1,3,0,2], 3)
