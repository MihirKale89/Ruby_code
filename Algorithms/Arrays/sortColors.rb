=begin

Given an array with n objects colored red, white or blue, sort them in-place
so that objects of the same color are adjacent, with the colors in the
order red, white and blue.

Here, we will use the integers 0, 1, and 2 to represent the color
red, white, and blue respectively.

Note: You are not suppose to use the library's sort function for this problem.

Example:

Input: [2,0,2,1,1,0]
Output: [0,0,1,1,2,2]
Follow up:

A rather straight forward solution is a two-pass algorithm using counting sort.
First, iterate the array counting number of 0's, 1's, and 2's, then overwrite
 array with total number of 0's, then 1's and followed by 2's.
Could you come up with a one-pass algorithm using only constant space?

=end

class SortColors
  def sort_colors(nums)
    len = nums.length
    count = 0
    i = 0
    while count < len
      case nums[i]
      when 0
        nums.delete_at(i)
        nums.insert(0,0)
        count+=1
        i+=1
      when 2
        nums.delete_at(i)
        nums.push(2)
        count+=1
      else
        count+=1
        i+=1
      end
    end
    nums
  end
end

sc = SortColors.new
# p sc.sort_colors([0,1])
# p sc.sort_colors([2,0,2,1,1,0])
# p sc.sort_colors([1,0])
p sc.sort_colors([1,0,2])
