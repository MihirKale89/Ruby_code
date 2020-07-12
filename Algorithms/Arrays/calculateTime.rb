=begin
given a keyboard and a word, calculate time required to type the word.

=end

class CalculateTime
  def calculate_time(keyboard, word)
    hsh = Hash.new
    keyboard.chars.each_with_index { |k,i| hsh[k] = i }
    sum = hsh[word[0]]
    p "sum = #{sum}"
    return sum if word.length == 1
    for i in 0...word.length-1
      p hsh
      p word[i]
      p word[i+1]
      p "abs = #{(hsh[word[i]]-hsh[word[i+1]]).abs}"
      sum += (hsh[word[i]]-hsh[word[i+1]]).abs
      p "sum = #{sum}"
    end
    sum
  end
end

ct = CalculateTime.new
p ct.calculate_time("abc", "cba")
