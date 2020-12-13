require 'matrix'

class SpiralMatrix
  def printSpiralMatrix(matrix)
    rows = matrix.row_count - 1
    columns = matrix.column_count - 1
    i = 0 # i is iterator
    while i <= rows/2
      for t in (i)..(columns-i) do
        print " #{matrix[i, t]}"
      end
      for r in (i+1)..(rows-i) do
        print " #{matrix[r, columns-i]}"
      end
      for b in (columns-i-1).downto(i) do
        print " #{matrix[rows-i, b]}"
      end
      for l in (columns-i-1).downto(i+1) do
        print " #{matrix[l, i]}"
      end
      i += 1
    end
  end
end

s = SpiralMatrix.new
puts s.printSpiralMatrix(Matrix[
  [1,2,3,4],
  [2,3,4,5],
  [1,6,5,6],
  [0,9,8,7]])
