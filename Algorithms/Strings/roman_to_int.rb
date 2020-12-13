class RomanToInt
  def roman_to_int(s)
    arr = s.chars
    index = 0
    sum = 0
    while index < arr.size
      case arr[index]
      when 'I'
        if arr[index + 1] == 'V'
          sum += 4
          index += 1
        elsif arr[index + 1] == 'X'
          sum += 9
          index += 1
        else
          sum += 1
        end
      when 'X'
        if arr[index + 1] == 'L'
          sum += 40
          index += 1
        elsif arr[index + 1] == 'C'
          sum += 90
          index += 1
        else
          sum += 10
        end
      when 'C'
        if arr[index + 1] == 'D'
          sum += 400
          index += 1
        elsif arr[index + 1] == 'M'
          sum += 900
          index += 1
        else
          sum += 100
        end
      when 'V'
        sum += 5
      when 'L'
        sum += 50
      when 'D'
        sum += 500
      when 'M'
        sum += 1000
      end
      index += 1
    end
    sum
  end
end

ri = RomanToInt.new
p ri.roman_to_int('VIII')
p ri.roman_to_int('IV')