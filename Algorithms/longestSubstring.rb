class LongestSubstring
  def longSub(str)
    str = str.downcase
    arr = Array.new(26)
    substr = ""
    max = ""
    start = 0
    len = (str.length) - 1
    for i in 0..len do
      if arr[str[i].ord - 97].nil?
        arr[str[i].ord - 97] = i
        substr = substr + str[i]
        max = substr if substr.length > max.length
      else
        start = arr[str[i].ord - 97] + 1
        arr.each { |a| a = nil if (!a.nil? && a < start) }
        arr[str[i].ord - 97] = i
        substr = str[start..i]
        break if max.length > (len-start)
      end
    end
    p "The longest substring in \'#{str}\' is \'#{max}\'"
  end
end

l1 = LongestSubstring.new
l1.longSub("abcdduvwxyz")
l1.longSub("Mihir")
l1.longSub("Pradeep")
l1.longSub("abcdabcdefghijklmnopqrstuvwxyzxwvuts")
l1.longSub("abcdepqrsteuvwxyzfghilmonpqrstu")
