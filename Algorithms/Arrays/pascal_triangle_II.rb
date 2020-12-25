class PascalTriangleII
  def generate(num_rows)
    return [] if num_rows == 0
    return [[1]] if num_rows == 1
    result = [[1]]
    (1...num_rows).each do |i|
      prev = result[i - 1]
      curr = []
      (0...prev.length - 1).each do |j|
        curr << prev[j] + prev[j + 1]
      end
      curr << 1
      curr.unshift(1)
      result << curr
    end
    result
  end
end

pt = PascalTriangleII.new
p pt.generate(6)
