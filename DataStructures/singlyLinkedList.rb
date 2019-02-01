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
    else
      temp1_index = 1
      temp2_index = 1
      temp1 = @front
      temp2 = @front
      while temp1 != nil
        temp1 = temp1.next
        temp1_index = temp1_index + 1
        if temp1_index == index - 1
          break
        end
      end
      while temp2 != nil
        temp2 = temp2.next
        temp2_index = temp2_index + 1
        if temp2_index == index
          break
        end
      end
      if temp1_index != index - 1
        puts "\n Cannot add at index #{index}. This index is beyond the size of the linked list."
      elsif temp1 == @rear
        addAtRear(data)
      elsif temp1_index == index -1 && temp2_index == index
        temp1.next = LinkedListNode.new
        temp1.next.data = data
        temp1 = temp1.next
        temp1.next = temp2
      end
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
    else
      temp1_index = 1
      temp2_index = 1
      temp1 = @front
      temp2 = @front
      while temp1 != nil
        temp1 = temp1.next
        temp1_index = temp1_index + 1
        if temp1_index == index - 1
          break
        end
      end
      while temp2 != nil || temp2_index != index + 1
        temp2 = temp2.next
        temp2_index = temp2_index + 1
        if temp2_index == index + 1
          break
        end
      end
      if temp1_index != index - 1 || temp1.next == nil
        puts "\n Cannot delete at index #{index}. This index is beyond the size of the linked list."
      elsif temp1.next == @rear
        deleteAtRear(data)
      elsif temp1_index == index -1 && temp2_index == index + 1
        temp1.next = nil
        temp1.next = temp2
      end
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
      while temp != nil
        print "#{temp.data} "
        temp = temp.next
      end
      puts "\n"
    end
  end

  def findAtIndexFromRear(index)
    req_index = findLength - index + 1
    findAtIndex(req_index)
  end

  def reverse
    # @front = 1->2->3->nil
    return nil if @front.nil?
    prev = nil
    curr = @front # 1->2->3->nil
    @rear = curr # 1->2->3->nil

    while(curr != nil)
      temp = curr.next # 2->3->nil  3->nil     nil
      curr.next = prev # nil        1->nil     2->1->nil
      prev = curr      # 1->nil     2->1->nil  3->2->1->nil
      curr = temp      # 2->3->nil  3->nil     nil 
    end
    @front = prev
  end
end

sll = SinglyLinkedList.new
sll.addAtRear(1)
sll.addAtRear(2)
sll.addAtRear(3)
sll.addAtRear(4)
sll.addAtRear(5)
sll.addAtFront(9)
sll.addAtFront(8)
sll.addAtFront(7)
sll.addAtFront(6)
sll.addAtIndex(3, 11)
sll.addAtIndex(4, 12)
sll.addAtIndex(5, 13)
sll.deleteAtFront
sll.deleteAtRear
sll.deleteAtIndex(5)
sll.deleteAtIndex(4)
sll.displayLinkedList
sll.reverse
sll.displayLinkedList

puts "\n The data at index 3 is #{sll.findAtIndex(3)}"
puts "\n The data at index 2 from rear is #{sll.findAtIndexFromRear(2)}"
