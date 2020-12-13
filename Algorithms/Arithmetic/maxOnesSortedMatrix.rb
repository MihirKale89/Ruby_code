# Find row index with max one in n * n matrix where
# each row is sorted and only has 0s and 1s
require 'matrix'

class MaxOnesSortedArray
  def maxOnesSortedArray(matrix)
    bestRow = -1
    bestColumn = -1
    row = 0
    column = matrix.row_count - 1
    while row < matrix.row_count
      while column >= 0
        if matrix[row, column] == 0
          break
        else
          bestColumn = column
          bestRow = row
        end
        column -= 1
      end
      row += 1
    end
    return bestRow
  end
end

m = MaxOnesSortedArray.new
p m.maxOnesSortedArray(Matrix[[0,0,0,1],[0,1,1,1],[0,0,1,1],[1,1,1,1]])
