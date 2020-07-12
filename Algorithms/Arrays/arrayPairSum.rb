class ArrayPairSum
  def array_pair_sum(nums)
    sum = 0
    i = 0
    while i < nums.length
        min = nums[i] > nums[i+1] ? nums[i+1] : nums[i]
        p min
        sum = sum + min if min > 0
        i+=2
        p sum
    end
    sum
  end
end

aps = ArrayPairSum.new
p aps.array_pair_sum([1,4,3,2])
