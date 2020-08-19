class CheckStraightLine
  def check_straight_line(coordinates)
    return true if coordinates.length == 2
    straight = true
    num = coordinates[1][1] - coordinates[0][1]
    den = coordinates[1][0] - coordinates[0][0]
    x = num.zero? ? 1 : -1
    x = 0 if den.zero?
    unless [0, 1].include? x
      m = (num.to_f / den)
      b = coordinates[0][1] - m * coordinates[0][0]
    end
    (2...coordinates.length).each do |i|
      if [0, 1].include? x
        if coordinates[i][x] != coordinates[0][x]
          straight = false
          break
        end
      elsif coordinates[i][1].to_f != m * coordinates[i][0] + b
        straight = false
        break
      end
    end
    straight
  end
end

csl = CheckStraightLine.new
p csl.check_straight_line([[0, 0], [0, 1], [0, -1]])
