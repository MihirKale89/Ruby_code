class Queue
  attr_accessor :store, :size, :head, :tail
  def initialize(size)
    @size = size
    @store = Array.new(@size)
    @head, @tail = -1, 0
  end

  def dequeue
    if empty?
      nil
    else
      @tail = @tail.succ

      dequeued = @store[@head]
      @store.unshift(nil)
      @store.pop
      dequeued
    end
  end

  def enqueue(element)
    if full? or element.nil?
      puts "Cannot enqueue #{element} as the queue is full"
      nil
    else
      @tail = @tail.pred
      @store[@tail] = element
      self
    end
  end

  def size
    @size
  end

  private

  def empty?
    @head == -1 and @tail == 0
  end

  def full?
    @tail.abs == (@size)
  end
end

q = Queue.new(5)
q.enqueue(1)
q.enqueue(2)
q.enqueue(3)
q.dequeue
q.enqueue(4)
q.enqueue(5)
q.enqueue(6)
q.enqueue(7)
q.dequeue
q.enqueue(8)
q.dequeue
q.enqueue(9)
q.dequeue
q.dequeue
q.enqueue(10)
p q.store
p q.head
p q.tail
