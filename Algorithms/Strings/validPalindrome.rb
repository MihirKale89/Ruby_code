=begin

Given a string, determine if it is a palindrome, considering only alphanumeric
characters and ignoring cases.

Note: For the purpose of this problem, we define empty string as valid palindrome.

Example 1:

Input: "A man, a plan, a canal: Panama"
Output: true
Example 2:

Input: "race a car"
Output: false


Constraints:

s consists only of printable ASCII characters.

=end

class ValidPalindrome
  def is_palindrome(s)
    front = 0
    back = s.length-1
    while front < back
      front+=1 while !!!s[front].match(/[0-9a-zA-Z]/) && front < back
      back-=1 while !!!s[back].match(/[0-9a-zA-Z]/) && front < back
      return false if s[front].downcase != s[back].downcase
      front+=1
      back-=1
    end
    true
  end
end

vp = ValidPalindrome.new
p vp.is_palindrome("A man, a plan, a canal: Panama")
p vp.is_palindrome("race a car")
