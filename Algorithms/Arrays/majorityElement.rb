=begin

Given an array of size n, find the majority element. The majority element is the
 element that appears more than ⌊ n/2 ⌋ times.

You may assume that the array is non-empty and the majority element always
exist in the array.

Example 1:

Input: [3,2,3]
Output: 3
Example 2:

Input: [2,2,1,1,1,2,2]
Output: 2

=end

class MajorityElement
  def majority_element(nums)
    candidate = nil
    count = 0
    nums.each do |e|
      return candidate if count > nums.length/2
      candidate = e if count == 0
      e == candidate ? count+=1 : count-=1
    end
    candidate
  end
end

me = MajorityElement.new
p me.majority_element([3,2,3])
p me.majority_element([2,2,1,1,1,2,2])
