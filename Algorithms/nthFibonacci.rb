class NthFibonacci
  def findFibonacciTerm(n)
    arr = Array.new()
    arr << 0
    arr << 1
    while arr.length < n
      arr << arr[arr.length-1]+arr[arr.length-2]
    end
    arr
  end
end

nf = NthFibonacci.new()
p nf.findFibonacciTerm(20)
