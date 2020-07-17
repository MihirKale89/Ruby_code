class NthFibonacci
  def findFibonacciTerm(n)
    return 0 if n == 1
    return 1 if n == 2
    prev_1 = 1
    prev_2 = 0
    fib = 0
    (n-2).times do
      fib = prev_1+prev_2
      prev_2, prev_1 = prev_1, fib
    end
    fib
  end
end

nf = NthFibonacci.new()
p nf.findFibonacciTerm(5)
