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

  def sortUsingTempStack
    tmpStack = Stack.new(@size)
    while !isEmpty
      tmp = pop
      while !tmpStack.isEmpty && tmp < tmpStack.peep
        push(tmpStack.pop)
      end
      tmpStack.push(tmp)
    end
    @ary.replace(tmpStack.ary)
    tmpStack.clearStack
  end
end

st = Stack.new(6)
st.push(3)
st.push(1)
st.push(2)
st.push(6)
st.push(4)
st.push(5)
p st.ary
st.sortUsingTempStack
p st.ary
