class FloodFill
  def flood_fill(image, sr, sc, new_color)
    moves = [[-1, 0], [1, 0], [0, 1], [0, -1]]
    rows = image.size
    columns = image[0].size
    visited = Array.new(rows).map { Array.new(columns) }
    color = image[sr][sc]
    # BFS
    visited[sr][sc] = true
    queue = [[sr, sc]]
    until queue.empty?
      point = queue.pop
      image[point[0]][point[1]] = new_color
      moves.each do |(delta_row, delta_col)|
        new_row = delta_row + point[0]
        new_col = delta_col + point[1]
        a = new_row.between?(0, rows - 1)
        next unless a
        b = new_col.between?(0, columns - 1)
        next unless b
        new_point = [new_row, new_col]
        c = visited[new_row][new_col].nil?
        d = image[new_row][new_col] == color
        if a && b && c && d
          visited[new_row][new_col] = true
          queue.unshift(new_point)
        end
      end
    end
    image
  end
end

ff = FloodFill.new
p ff.flood_fill([[1, 1, 1], [1, 1, 0], [1, 0, 1]], 1, 1, 2)
