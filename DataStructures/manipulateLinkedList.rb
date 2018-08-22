class LinkedListNode
  attr_accessor :data, :next
  def initialize
    @data = nil
    @next = nil
  end
end

class SinglyLinkedList
  attr_accessor :front, :rear
  def initialize
    @front = nil
    @rear = nil
  end

  def isEmpty
    return @front == nil
  end

  def addAtFront(data)
    if isEmpty
      @front = LinkedListNode.new
      @front.data = data
      @rear = @front
    else
      temp = LinkedListNode.new
      temp.data = data
      temp.next = @front
      @front = temp
    end
  end

  def addAtRear(data)
    if isEmpty
      @front = LinkedListNode.new
      @front.data = data
      @rear = @front
    else
      @rear.next = LinkedListNode.new
      @rear.next.data = data
      @rear = @rear.next
    end
  end

  def addAtIndex(index, data)
    # Assuming that Front starts with index 1.
    if index == 1
      addAtFront(data)
    elsif index-1 == findLength()
      addAtRear(data)
    elsif index-1 > findLength()
      puts "\n Cannot add at index #{index}. This index is beyond the size of the linked list."
    else
      temp1_index = 1
      temp1 = @front
      while temp1_index != index - 1
        temp1 = temp1.next
        temp1_index = temp1_index + 1
      end
      temp2 = temp1.next
      temp1.next = LinkedListNode.new
      temp1.next.data = data
      temp1 = temp1.next
      temp1.next = temp2
    end
  end

  def deleteAtFront()
    if isEmpty
      puts "Cannot Delete. Singly Linked List is empty."
    elsif @front == @rear
      @front = nil
      @rear = nil
    else
      temp = @front.next
      @front = nil
      @front = temp
    end
  end

  def deleteAtRear()
    if isEmpty
      puts "Cannot Delete. Singly Linked List is empty."
    elsif @front == @rear
      @front = nil
      @rear = nil
    else
      temp = @front
      while temp.next != @rear
        temp = temp.next
      end
      @rear = temp
      @rear.next = nil
    end
  end

  def deleteAtIndex(index)
    # Assuming that Front starts with index 1.
    if isEmpty
      puts "Cannot Delete. Singly Linked List is empty."
    elsif index == 1
      deleteAtFront
    elsif index == findLength()
      deleteAtRear
    elsif index > findLength()
      puts "\n Cannot delete at index #{index}. This index is beyond the size of the linked list."
    else
      temp1_index = 1
      temp1 = @front
      while temp1_index != index - 1
        temp1 = temp1.next
        temp1_index += 1
      end
      temp2 = temp1.next.next
      temp1.next = nil
      temp1.next = temp2
    end
  end

  def findAtIndex(index)
    # Assuming that Front starts with index 1.
    if isEmpty || index < 1
      return nil
    elsif index == 1
      return @front.nil? ? nil : @front.data
    else
      temp = @front
      temp_index = 1
      while temp != nil
        temp = temp.next
        # temp = temp.nil? ? nil : temp.next
        temp_index = temp_index + 1
        if temp_index == index
          break
        end
      end
      return temp.nil? ? nil : temp.data
    end
  end

  def findLength
    if isEmpty
      return 0
    elsif @front == @rear
      return 1
    else
      length = 1
      temp = @front
      while temp != @rear
        temp = temp.next
        length = length + 1
      end
      return length
    end
  end

  def displayLinkedList
    if isEmpty
      print "\n Linked List is empty."
    elsif @front == @rear
      print "\nElement in Linked List: #{@front.data}"
    else
      print "\nElements in Linked List : "
      temp = @front
      while temp != @rear
        print "#{temp.data} "
        temp = temp.next
      end
      print "#{temp.data} "
      puts "\n"
    end
  end

  def reverse_list
    cur = @front;
    prev = nil
      while cur
        nxt = cur.next
        cur.next = prev

        prev = cur
        cur = nxt
      end
    @front = prev
    temp = @front
    while temp.next != nil
      temp = temp.next
    end
    @rear = temp
    displayLinkedList
  end

  def oddEvenLinkedList(odd)
    start = odd ? 3 : 2
    length = findLength
    while start <= length
      temp_data = findAtIndex(start)
      deleteAtIndex(start)
      addAtIndex((start+1)/2, temp_data)
      start += 2
    end
    displayLinkedList()
  end

  # def sortOddEven(odd)
  #   oddHead = @front
  #   evenHead = @front.next
  #   oddNode = oddHead
  #   evenNode = evenHead
  #   while oddNode != @rear || oddNode.next != @rear
  #     oddNode.next = oddNode.next.next if oddNode.next.next != nil
  #     evenNode.next = evenNode.next.next if evenNode.next.next != nil
  #   end
  #   if odd
  #     oddNode.next = evenHead
  #     @front = oddHead
  #     temp = @front
  #     while temp.next != nil
  #       temp = temp.next
  #     end
  #     @rear = temp
  #   else
  #     evenNode.next = oddHead
  #     @front = evenHead
  #     temp = @front
  #     while temp.next != nil
  #       temp = temp.next
  #     end
  #     @rear = temp
  #   end
  #   displayLinkedList
  # end

  def findAtIndexFromRear(index)
    req_index = findLength - index
    findAtIndex(req_index)
  end
end

sll = SinglyLinkedList.new
sll2 = SinglyLinkedList.new
sll.addAtRear(1)
sll.addAtRear(2)
sll.addAtRear(3)
sll.addAtRear(4)
sll.addAtRear(5)
sll.addAtRear(6)
sll.addAtRear(7)
sll.addAtIndex(8, 8)
sll.addAtIndex(9, 9)
sll.addAtIndex(3, 3)
sll.deleteAtIndex(3)
sll.addAtIndex(10, 10)
sll.addAtIndex(11, 11)
sll.addAtIndex(12, 12)
sll.deleteAtIndex(11)
sll.deleteAtIndex(11)
puts ""
puts "The length of the Linked List is #{sll.findLength()}"
puts "The data at index 3 is #{sll.findAtIndex(3)}"
puts "The data at index 2 from rear is #{sll.findAtIndexFromRear(2)}"
puts ""
puts "------------ NOW DISPLAYING LINKED LIST SLL ------------"
sll.displayLinkedList
puts ""
puts "------------ NOW REVERSING THE LINKED LIST ------------"
sll.reverse_list
puts ""
puts "------------ NOW SORTING ODD ELEMENTS BEFORE EVEN ELEMENTS ------------"
sll.oddEvenLinkedList(true)
puts ""
puts "------------ NOW DISPLAYING LINKED LIST SLL2 ------------"
sll2.addAtRear(1)
sll2.addAtRear(2)
sll2.addAtRear(3)
sll2.addAtRear(4)
sll2.addAtRear(5)
sll2.addAtRear(6)
sll2.addAtRear(7)
sll2.addAtIndex(8, 8)
sll2.addAtIndex(9, 9)
sll2.addAtIndex(10, 10)
sll2.displayLinkedList
puts ""
puts "------------ NOW SORTING EVEN ELEMENTS BEFORE ODD ELEMENTS ------------"
sll2.oddEvenLinkedList(false)
sll3 = SinglyLinkedList.new
sll3.addAtRear(4)
sll3.addAtRear(2)
sll3.addAtRear(3)
sll3.addAtRear(1)
puts "------------ NOW DISPLAYING LINKED LIST SLL3 ------------"
sll3.displayLinkedList
puts ""
puts "------------ NOW REVERSING THE LINKED LIST ------------"
sll3.reverse_list
