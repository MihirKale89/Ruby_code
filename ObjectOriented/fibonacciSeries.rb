class Fibonacci
  def generate_fibonacci_series
     arr = [] << 0 << 1
     (2..6).each do |i|
       arr[i] = arr[i-1] + arr[i-2]
     end
     p arr
  end
end

fb = Fibonacci.new
fb.generate_fibonacci_series
