# @param {Integer[]} nums
# @return {Integer}
# Input: [-2,1,-3,4,-1,2,1,-5,4],
# Output: 6
# Explanation: [4,-1,2,1] has the largest sum = 6.

def max_sub_array(nums)
  return nil if nums.empty?
  return nums[0] if nums.length == 1
  max_ending_sum = max_slice_sum = nums[0]
  n=nums.length
  for i in 1...n
    max_ending_sum = [nums[i],(max_ending_sum+nums[i])].max
    p "Max ending sum at i =  #{i} is #{max_ending_sum}"
    max_slice_sum = [max_slice_sum,max_ending_sum].max
    p "Max slice sum at i =  #{i} is #{max_slice_sum}"
  end
  return  max_slice_sum
end

p "The max sub array of #{[-2,1,-3,4,-1,2,1,-5,4]} is: "+max_sub_array([-2,1,-3,4,-1,2,1,-5,4]).to_s
# p "The max sub array of #{[2]} is: "+max_sub_array([2]).to_s
