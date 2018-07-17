class Stack
  attr_accessor :ary, :size
  def initialize(size)
    @ary = Array.new
    @size = size
  end

  def clearStack
    @ary.clear
  end

  def isEmpty
    return @ary.size == 0
  end

  def isFull
    return @ary.size == size
  end

  def push(element)
    if !isFull
      @ary.push(element)
    else
      puts "Cannot push any more elements. The stack is full."
    end
  end

  def peep
    if isEmpty
      return nil
    else
      return @ary[@ary.size - 1]
    end
  end

  def pop
    if !isEmpty
      return @ary.pop
    else
      return "Cannot pop any more elements. The stack is empty."
    end
  end
end

class Queue
  attr_accessor :inbox, :outbox, :qsize
  def initialize(qsize)
    @inbox = Stack.new(qsize)
    @outbox = Stack.new(qsize)
    qsize = qsize
  end

  def isQEmpty
    return @inbox.isEmpty
  end

  def isQFull
    return  @inbox.isFull
  end

  def enQueue(element)
    if !isQFull
      @inbox.push(element)
    else
      puts "Cannot enQueue anymore. Queue is full."
    end
  end

  def transfer(sourceStack, destinationStack)
    while !sourceStack.isEmpty
      destinationStack.push(sourceStack.pop)
    end
  end

  def deQueue
    if isQEmpty
      puts "Cannot deQueue. Queue is empty."
      return "Cannot deQueue. Queue is empty."
    else
      transfer(@inbox, @outbox)
      # puts "The element popped is #{@outbox.pop}"
      deletedElement = @outbox.pop
      transfer(@outbox, @inbox)
      return deletedElement
    end
  end

  def clearQueue
    @inbox.clearStack
    @outbox.clearStack
  end

  def peepQueue
    if isQEmpty
      puts "Cannot peep. Queue is empty."
      return "Cannot peep. Queue is empty."
    else
      transfer(@inbox, @outbox)
      peepElement = @outbox.peep
      #puts "The element peeped is #{@outbox.peep}"
      transfer(@outbox, @inbox)
      return peepElement
    end
  end
end

q = Queue.new(5)
q.enQueue(1)
q.enQueue(2)
q.enQueue(3)
q.enQueue(4)
q.enQueue(5)
q.enQueue(6)

p "Checking if queue is empty : #{q.isQEmpty}"
p "Checking if queue is full : #{q.isQFull}"
puts "The next element out of the queue is #{q.peepQueue}"
puts "The element deleted is #{q.deQueue}"
puts "The element deleted is #{q.deQueue}"
puts "The element deleted is #{q.deQueue}"
q.clearQueue
