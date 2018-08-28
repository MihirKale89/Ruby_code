class LongestValidParentheses
  def longest_valid_parentheses(s)
    return 0 if s.nil? || s.length < 2
    opening_indexes = Array.new
    closing_indexes = Array.new
    maxStr = ""
    curStr = ""
    s.each_char.with_index do |char, index|
      opening_indexes << index if char == "("
      closing_indexes << index if char == ")"
      if closing_indexes.length > opening_indexes.length
        opening_indexes.clear
        closing_indexes.clear
      end
      if closing_indexes.length > 0
        start = opening_indexes[closing_indexes.length * -1]
        curStr = s[start..index]
        maxStr = curStr if maxStr.length < curStr.length
        # opening_indexes.pop
        closing_indexes.pop
      end
    end
    puts "The longest balanced substring in #{s} is #{maxStr}"
    return maxStr == "" ? 0 : maxStr.length
  end
end

l1 = LongestValidParentheses.new
p l1.longest_valid_parentheses("()(()")
p l1.longest_valid_parentheses(")()())")
# p l1.longest_valid_parentheses("))()")
# p l1.longest_valid_parentheses("((())((()))")
