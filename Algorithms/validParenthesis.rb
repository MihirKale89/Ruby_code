class ValidParenthesis
  def is_valid(s)
    return true if s == "" || s.nil?
    return false if s.length%2 != 0
    brackets = Array.new
    s.each_char { |chr|
      return false if brackets.empty? && (chr == '}' || chr == ')' || chr == ']')
      brackets.push chr if chr == '{' || chr == '(' || chr == '['
      brackets.pop if chr == '}' && brackets.last == '{'
      brackets.pop if chr == ')' && brackets.last == '('
      brackets.pop if chr == ']' && brackets.last == '['
    }
    return brackets.empty?
  end
end

vp = ValidParenthesis.new
p vp.is_valid("()[]{}")
p vp.is_valid("()")
p vp.is_valid("([)]")
p vp.is_valid("{[]}")
p vp.is_valid("(())))")
