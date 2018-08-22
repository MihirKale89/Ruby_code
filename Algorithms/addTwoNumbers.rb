# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}

def add_two_numbers(l1, l2)
  num1_arr = Array.new()
  num2_arr = Array.new()
  temp1 = l1
  temp2 = l2
  while(temp1 != nil)
      num1_arr.push temp1.val
      temp1 = temp1.next
  end
  while(temp2 != nil)
      num2_arr.push temp2.val
      temp2 = temp2.next
  end
end
