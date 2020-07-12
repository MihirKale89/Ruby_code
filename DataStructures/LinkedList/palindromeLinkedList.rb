# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end

    def print_list
      runner = self
      while runner
        print "#{runner.val} "
        runner = runner.next
      end
    end
end

# @param {ListNode} head
# @param {Integer} m
# @param {Integer} n
# @return {ListNode}

class PalindromeLinkedList
  def is_palindrome(head)
    return true if head.nil? || head.next.nil?
    return head.val == head.next.val if head.next.next.nil?
    h_copy = nil
    runner = head
    runner2 = head
    index = 0
    while runner2
      index+=1 if runner2&.next
      index+=1 if runner2&.next&.next
      temp2 = ListNode.new(runner.val)
      temp2.next = h_copy
      h_copy = temp2
      runner = runner.next
      runner2 = runner2.next&.next
    end
    h_copy = h_copy.next if index%2 == 0
    while runner
      return false if h_copy.val != runner.val
      h_copy = h_copy.next
      runner = runner.next
    end
    true
  end
end

head = ListNode.new
runner = head
(0..1).each do |i|
  runner.val = i
  runner.next = ListNode.new
  runner = runner.next
end
# (2).downto(1) do |i|
#   runner.val = i
#   runner.next = ListNode.new
#   runner = runner.next
# end
head.print_list
puts ""
pll = PalindromeLinkedList.new
p pll.is_palindrome(head)
