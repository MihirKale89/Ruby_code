class LongestUniqueSubstring
  def longestUniqueSubstring(str)
   distinctChars = Hash.new
   substr = ""
   max = ""
   start = 0
   len = (str.length) - 1
   for index in 0..len do
     char = str[index]
     if distinctChars["#{char}"].nil?
       distinctChars["#{char}"] = index
     else
       start = distinctChars["#{char}"] + 1
       distinctChars.each { |key, value| distinctChars.delete(key) if value < start }
       substr = str[start..index-1]
       distinctChars["#{char}"] = index
       break if max.length > (len - start)
     end
     substr += char
     max = substr if max.length < substr.length
   end
   p "The longest unique substring in \'#{str}\' is \'#{max}\'"
   return max.length
  end
end

l1 = LongestUniqueSubstring.new
l1.longestUniqueSubstring("abcbcdefgfab")
l1.longestUniqueSubstring("Mihir")
l1.longestUniqueSubstring("pqrabcdefghijklmopqrstuvwxyzabc")
l1.longestUniqueSubstring("abbadabbajabbaparampara")
p l1.longestUniqueSubstring("dvefdg")
