=begin

In a given grid, each cell can have one of three values:

the value 0 representing an empty cell;
the value 1 representing a fresh orange;
the value 2 representing a rotten orange.
Every minute, any fresh orange that is adjacent (4-directionally) to a rotten
 orange becomes rotten.

Return the minimum number of minutes that must elapse until no cell has a fresh
 orange.  If this is impossible, return -1 instead.

Example 1:

Input: [[2,1,1],[1,1,0],[0,1,1]]
Output: 4
Example 2:

Input: [[2,1,1],[0,1,1],[1,0,1]]
Output: -1
Explanation:  The orange in the bottom left corner (row 2, column 0) is never
rotten, because rotting only happens 4-directionally.
Example 3:

Input: [[0,2]]
Output: 0
Explanation:  Since there are already no fresh oranges at minute 0, the answer
is just 0.

Note:

1 <= grid.length <= 10
1 <= grid[0].length <= 10
grid[i][j] is only 0, 1, or 2.
=end

class RottingOranges
  def oranges_rotting(grid)
    return 0 if grid.empty?
    return 0 if count_fresh(grid) == 0
    return -1 if find_all_rotten(grid).empty?
    t = 0
    while count_fresh(grid) > 0
        # find all 2s

        changed = false

        rotten = find_all_rotten(grid)

        rotten.each do |pos|
            if (pos.first+1 < grid.size && grid[pos.first+1][pos.last] == 1)
                grid[pos.first+1][pos.last] = 2
                changed = true
            end
            if (pos.last+1 < grid.first.size && grid[pos.first][pos.last+1] == 1)
                grid[pos.first][pos.last+1] = 2
                changed = true
            end
            if (pos.first-1 >= 0 && grid[pos.first-1][pos.last] == 1)
                grid[pos.first-1][pos.last] = 2
                changed = true
            end
            if (pos.last-1 >= 0 && grid[pos.first][pos.last-1] == 1)
                grid[pos.first][pos.last-1] = 2
                changed = true
            end
        end
        # p grid
        break if !changed
        t+=1
    end
    return count_fresh(grid) == 0 ? t:-1
  end

  def count_fresh(grid)
      count_fresh = 0
      grid.each do |row|
          count_fresh += row.count{|x| x == 1}
      end
      return count_fresh
  end

  def find_all_rotten(grid)
      rotten = []
      grid.each_with_index do |row,i|
          row.each_with_index do |x,j|
              rotten << [i,j] if x == 2
          end
      end
      return rotten
  end
end

ro = RottingOranges.new
p ro.oranges_rotting([[2,1,1],[1,1,0],[0,1,1]])
