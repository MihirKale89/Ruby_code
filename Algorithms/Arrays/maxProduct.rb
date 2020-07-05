=begin

Given an integer array nums, find the contiguous subarray within an
array (containing at least one number) which has the largest product.

Example 1:

Input: [2,3,-2,4]
Output: 6
Explanation: [2,3] has the largest product 6.
Example 2:

Input: [-2,0,-1]
Output: 0
Explanation: The result cannot be 2, because [-2,-1] is not a subarray.

=end

class MaxProduct
  def max_product(nums)
    return nums[0] if nums.length == 1
    max = nums[0]
    prod = nums[0]
    for i in (1...nums.length)
      prod = [prod*nums[i], nums[i]].max
      max = [max, prod].max
    end
    max
  end
end

mp = MaxProduct.new
p mp.max_product([2,3,-2,4])
p mp.max_product([-2,0,-1])
p mp.max_product([0,2])
