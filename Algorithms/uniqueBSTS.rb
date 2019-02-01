class UniqueBSTS
  def unique_bsts(n)
  a = Array.new(n+1, 0)
  a[0] = a[1] = 1

    (2..n).each do |i|
      (1..i).each do |j|
        a[i] += (a[j-1] * a[i-j])
      end
    end
  return a[n]
  end
end
ub = UniqueBSTS.new
p ub.unique_bsts(3) 
