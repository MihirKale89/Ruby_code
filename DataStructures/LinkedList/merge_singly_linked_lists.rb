# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}

class MergeSinglyLinkedLists
  def merge_two_lists(l1, l2)
    cur = root = ListNode.new nil, nil
    until l1.nil? || l2.nil? do
      if l1.val < l2.val
        cur = cur.next = l1
        l1 = l1.next
      else
        cur = cur.next = l2
        l2 = l2.next
      end
    end
    cur.next = l1.nil? ? l2 : l1
    root.next
  end
end



