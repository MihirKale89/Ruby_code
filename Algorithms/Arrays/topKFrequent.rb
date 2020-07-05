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

class TopKFrequent
  def top_k_frequent(nums, k)
   h = Hash.new(0)
   nums.each { |e| h[e]+=1 }
   h = h.sort_by {|k, v| -v}.to_h
   h.keys[0...k]
  end
end

tf = TopKFrequent.new
p tf.top_k_frequent([1,1,1,2,2,3], 2)
p tf.top_k_frequent([1],1)
p tf.top_k_frequent([3,0,1,0],1)
