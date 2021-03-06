=begin

Write a function that reverses a string. The input string is given as an array of characters char[].

Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.

You may assume all the characters consist of printable ascii characters.



Example 1:

Input: ["h","e","l","l","o"]
Output: ["o","l","l","e","h"]

Example 2:
Input: ["H","a","n","n","a","h"]
Output: ["h","a","n","n","a","H"]

=end

class ReverseString
  def reverse_string(s)
    first, last = -1, s.length
    s[first], s[last] = s[last], s[first] until (first += 1) > (last -= 1)
  end
end

rs = ReverseString.new
p rs.reverse_string(["H","a","n","n","a","h"])
