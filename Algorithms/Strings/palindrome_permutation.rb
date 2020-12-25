# Given a string, determine if a permutation of the string could form a palindrome.

class PalindromePermutation
  def can_permute_palindrome(s)
    hsh = Hash.new(0)
    count = 0
    s.chars.each do |char|
      hsh[char] += 1
      count = hsh[char].even? ? count - 1 : count + 1
    end
    count <= 1
  end
end

pp = PalindromePermutation.new
p pp.can_permute_palindrome('code')
p pp.can_permute_palindrome('malayalam')
