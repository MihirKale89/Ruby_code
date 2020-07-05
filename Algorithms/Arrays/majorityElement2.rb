=begin

Given an integer array of size n, find all elements that appear
more than ⌊ n/3 ⌋ times.

Note: The algorithm should run in linear time and in O(1) space.

Example 1:

Input: [3,2,3]
Output: [3]
Example 2:

Input: [1,1,1,3,3,2,2,2]
Output: [1,2]

=end

class MajorityElement2
  def majority_element(nums)
    return [] if nums.empty?
  	return nums if nums.length == 1
  	thresh = nums.length / 3
  	nums << "exit"
  	while nums[0] != "exit"
  	   num = nums[0]
  		if nums.count(num) > thresh
  			nums.delete(num)
  			nums << num
  		else
  		   nums.delete(num)
  		end

  	end

  	exit_index = nums.index("exit")

  	return nums[exit_index+1..-1]
  end
end

me = MajorityElement2.new
p me.majority_element([0,3,4,0])
p me.majority_element([1,2,3])
p me.majority_element([3,2,3])
p me.majority_element([2,2,1,1,1,2,2])
