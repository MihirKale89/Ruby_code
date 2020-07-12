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

class DeleteNodes
  def delete_nodes(head, m, n)
      runner = head
      while runner
          (2..m).each { runner = runner&.next }
          temp = runner if runner
          (1..n).each { temp = temp&.next }
          runner&.next = temp&.next
          runner = runner&.next
      end
      p head.print_list
  end
end

head = ListNode.new(1)
runner = head
(1..13).each do |i|
  runner.val = i
  runner.next = ListNode.new
  runner = runner.next
end
head.print_list
puts ""
dn = DeleteNodes.new
dn.delete_nodes(head, 3,1)
