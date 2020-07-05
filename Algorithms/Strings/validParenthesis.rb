=begin
Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

An input string is valid if:

Open brackets must be closed by the same type of brackets.
Open brackets must be closed in the correct order.
Note that an empty string is also considered valid.

Example 1:

Input: "()"
Output: true
Example 2:

Input: "()[]{}"
Output: true
Example 3:

Input: "(]"
Output: false
Example 4:

Input: "([)]"
Output: false
Example 5:

Input: "{[]}"
Output: true

=end


class ValidParenthesis
  def is_valid(s)
    return true if s == "" || s.nil?
    return false if s.length%2 != 0
    brackets = Array.new
    ob = ['(','{','[']
    cb = [')','}',']']
    s.each_char do |chr|
      if ob.include? chr
        brackets << chr
      else
        return false if ob.index(brackets.last) != cb.index(chr)
        brackets.pop
      end
    end
    brackets.empty?
  end
end

vp = ValidParenthesis.new
p vp.is_valid("()[]{}")
p vp.is_valid("()")
p vp.is_valid("([)]")
p vp.is_valid("{[]}")
p vp.is_valid("(())))")
