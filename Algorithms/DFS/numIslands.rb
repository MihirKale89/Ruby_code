=begin

Given a 2d grid map of '1's (land) and '0's (water), count the number
of islands. An island is surrounded by water and is formed by connecting
adjacent lands horizontally or vertically. You may assume all four edges
of the grid are all surrounded by water.



Example 1:

Input: grid = [
  ["1","1","1","1","0"],
  ["1","1","0","1","0"],
  ["1","1","0","0","0"],
  ["0","0","0","0","0"]
]
Output: 1
Example 2:

Input: grid = [
  ["1","1","0","0","0"],
  ["1","1","0","0","0"],
  ["0","0","1","0","0"],
  ["0","0","0","1","1"]
]
Output: 3


=end


class NumIslands
  def num_islands(grid)
    return 0 if grid.empty?

    count = 0

    0.upto(grid.size-1) do |i|
      0.upto(grid.first.size-1) do |j|
        if grid[i][j] == "1"
          dfs(i,j,grid)
          count+=1
        end
      end
    end
    return count
  end

  def dfs(i,j,grid)
    if (i<0 || j<0 || i>=grid.size || j>=grid.first.size || grid[i][j]=="0")
      return
    else
      grid[i][j] = "0"
      dfs(i-1,j,grid)
      dfs(i+1,j,grid)
      dfs(i,j-1,grid)
      dfs(i,j+1,grid)
    end
  end
end

ni = NumIslands.new
p ni.num_islands([["1","1","1","1","0"],["1","1","0","1","0"],["1","1","0","0","0"],["0","0","0","0","0"]])
