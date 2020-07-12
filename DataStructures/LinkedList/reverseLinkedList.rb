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

class ReverseLinkedList
  def reverse(head)
    temp = nil
    runner = head
    while runner
      temp2 = ListNode.new(runner.val)
      temp2.next = temp
      temp = temp2
      runner = runner.next
    end
    # while runner
    #    temp, temp.next, runner = runner, temp, runner.next
    # end
    temp.print_list
  end
end

head = ListNode.new
runner = head
(0..5).each do |i|
  runner.val = i
  runner.next = ListNode.new
  runner = runner.next
end
(4).downto(1) do |i|
  runner.val = i
  runner.next = ListNode.new
  runner = runner.next
end
head.print_list
puts ""
rll = ReverseLinkedList.new
p rll.reverse(head)
