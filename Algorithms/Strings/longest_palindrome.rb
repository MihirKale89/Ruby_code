# Given a string s which consists of lowercase or uppercase letters, return the
# length of the longest palindrome that can be built with those letters.

# Letters are case sensitive, for example, "Aa" is not considered a palindrome here.

class LongestPalindrome
  def longest_palindrome(s)
    hsh = Hash.new(0)
    s.chars.each do |char|
      hsh[char] += 1
    end
    sum = 0
    hsh.values.each do |v|
      sum += v / 2 * 2
      sum += 1 if sum.even? && v.odd?
    end
    sum
  end
end