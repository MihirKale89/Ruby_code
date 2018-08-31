class LongestValidParentheses
  def longest_valid_parentheses(s)
    return 0 if s.nil? || s.length < 2
    indexes = Array.new
    indexes << -1
    maxLen = 0
    maxStr = ""
    s.each_char.with_index do |char, index|
      if char == "("
        indexes << index
      else
        indexes.pop
        if indexes.empty?
          indexes << index
        else
          maxLen = maxLen > (index - indexes.last) ? maxLen : (index - indexes.last)
          maxStr = s[indexes.last+1..index] if maxStr.length < maxLen
        end
      end
    end
    puts "The longest balanced substring in #{s} is #{maxStr}"
    return maxLen
  end
end

l1 = LongestValidParentheses.new
p l1.longest_valid_parentheses("()(()")
p l1.longest_valid_parentheses(")()())")
p l1.longest_valid_parentheses("))()")
p l1.longest_valid_parentheses("((())((()))")
