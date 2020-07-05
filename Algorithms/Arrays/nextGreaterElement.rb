=begin


=end

class NextGreaterElement
  def next_greater_element(nums1, nums2)
    stack = []
    next_greater_ele = Hash.new(-1)
    result = []

    nums2.each { |n|
      while( stack.any? && stack.last < n )
        next_greater_ele[stack.pop] = n
      end
      stack.push(n)
    }
    nums1.each { |n|
      result << next_greater_ele[n]
    }
    result
  end
end

nge = NextGreaterElement.new
p nge.next_greater_element([4,1,2], [1,3,4,2])
p nge.next_greater_element([2,4], [1,2,3,4])
