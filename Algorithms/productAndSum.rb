=begin

Given an integer number n, return the difference between the product of
its digits and the sum of its digits.

Example 1:

Input: n = 234
Output: 15
Explanation:
Product of digits = 2 * 3 * 4 = 24
Sum of digits = 2 + 3 + 4 = 9
Result = 24 - 9 = 15
Example 2:

Input: n = 4421
Output: 21
Explanation:
Product of digits = 4 * 4 * 2 * 1 = 32
Sum of digits = 4 + 4 + 2 + 1 = 11
Result = 32 - 11 = 21

Constraints:

1 <= n <= 10^5

=end

class ProductAndSum
  def subtract_product_and_sum(n)
    prod, sum = 1, 0
    prod, sum, n = prod * (n%10), sum + n%10, n/10 while n > 0
    p prod
    p sum
    prod - sum
  end
end

ps = ProductAndSum.new
ps.subtract_product_and_sum(234)
