class TypeTime
  def typeTime(s, keypad)
    keypad_nums = keypad.each_char.map(&:to_i)
    keypad_rows = Hash.new
    keypad_columns = Hash.new
    index = 0
    while index < keypad_nums.length do
      keypad_rows[keypad_nums[index]] = index/3
      keypad_columns[keypad_nums[index]] = index%3
      index += 1
    end
    s_nums = s.each_char.map(&:to_i)
    index = 1
    totaltime = 0
    while index < s_nums.length do
      prevNum = s_nums[index -1]
      currNum = s_nums[index]
      rowDiff = keypad_rows[prevNum] - keypad_rows[currNum]
      rowDiff *= -1 if rowDiff < 0
      columnDiff = keypad_columns[prevNum] - keypad_columns[currNum]
      columnDiff *= -1 if columnDiff < 0
      totaltime += columnDiff > rowDiff ? columnDiff : rowDiff
      index += 1
    end
    return totaltime
  end
end

tt = TypeTime.new
puts "The time required to type '54368' with keypad '951623847' is "+tt.typeTime('54368','951623847').to_s+" seconds."
puts "The time required to type '89732' with keypad '987321564' is "+tt.typeTime('89732','987321564').to_s+" seconds."
puts "The time required to type '17283' with keypad '123456789' is "+tt.typeTime('17283','123456789').to_s+" seconds."
