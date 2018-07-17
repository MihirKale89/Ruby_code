class LongestSubstringKDistinct
  def longSubstrKDistinct(str, k)
    return 0 if k == 0
    distinctChars = Hash.new
    substr = ""
    max = ""
    start = 0
    len = (str.length) - 1
    for index in 0..len do
      char = str[index]
      if distinctChars.length < k || !distinctChars["#{char}"].nil?
        if !(distinctChars.keys[distinctChars.length-1] == "#{char}")
          distinctChars.delete("#{char}")
          distinctChars["#{char}"] = index
        end
      #  p "distinctChars : #{distinctChars}"
      substr += char
      else
        distinctChars.delete(distinctChars.keys[0])
        distinctChars["#{char}"] = index
        #  p "distinctChars : #{distinctChars}"
        start = distinctChars.values[0]
        substr = str[start..index]
      end
      #  p "substring is #{substr}"
      max = substr if max.length < substr.length
      break if max.length > (len - start)
    end
    p "The longest substring with at most #{k} distinct characters in \'#{str}\' is \'#{max}\'"
    return max.length
  end
end

l1 = LongestSubstringKDistinct.new
l1.longSubstrKDistinct("ccaabbb", 2)
l1.longSubstrKDistinct("abaccc", 2)
l1.longSubstrKDistinct("Mihir", 2)
l1.longSubstrKDistinct("Mihir", 3)
l1.longSubstrKDistinct("Mihir", 4)
l1.longSubstrKDistinct("Aditya", 5)
l1.longSubstrKDistinct("Aditya", 6)
l1.longSubstrKDistinct("eceeba", 0)
