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

  def two_sum(nums, target)
    uniqueElements = Hash.new
    result_arr = Array.new
    index = 0
    while index < nums.length
      if uniqueElements[target - nums[index]]
        result_arr.push uniqueElements[target - nums[index]]
        result_arr.push index
        break
      else
        uniqueElements[nums[index]] = index
      end
      index += 1
    end
    return result_arr
  end

  def two_sum_each(nums, target)
    uniqueElements = Hash.new
    result_arr = Array.new
    nums.each_with_index do |num, index|
      if uniqueElements[target - num]
        result_arr.push uniqueElements[target - num]
        result_arr.push index
        break
      else
        uniqueElements[num] = index
      end
    end
    return result_arr
  end
end

ts = TwoSum.new
puts ts.twoSumExists?([1,2,3,9], 8)
puts ts.twoSumExists?([1,2,4,4], 8)
puts ts.twoSumExists?([1,3,0,2], 3)
p ts.two_sum([2,7,8,9], 9)
p ts.two_sum([2,7,8,9], 15)
p ts.two_sum([2,7,8,3], 5)
p ts.two_sum_each([2,7,8,9], 9)
p ts.two_sum_each([2,7,8,9], 15)
p ts.two_sum_each([2,7,8,3], 5)
