# You may recall that an array arr is a mountain array if and only if:
#
#                    arr.length >= 3
# There exists some index i (0-indexed) with 0 < i < arr.length - 1 such that:
#                    arr[0] < arr[1] < ... < arr[i - 1] < arr[i]  AND arr[i] > arr[i + 1] > ... > arr[arr.length - 1]
# Given an integer array nums, return the minimum number of elements to remove to make nums a mountain array.


class MinimumMountainRemovals
  def minimum_mountain_removals(nums)
    res = 2**32
    n = nums.size

    longest_inc_seq = longest_increase_array_len(nums)
    longest_dec_seq = longest_decrease_array_len(nums)

    (0...n).each do |i|
      next if longest_inc_seq[i] < 2 || longest_dec_seq[i] < 2
      res = [res, n - (longest_inc_seq[i] + longest_dec_seq[i] - 1)].min
    end
    res != 2**32 ? res : 0
  end

  def longest_increase_array_len(nums)
    n = nums.size
    dp = Array.new(n, 1)

    (1...n).each do |i|
      (0..i).each do |j|
        dp[i] = dp[j] + 1 if nums[i] > nums[j] && dp[i] < dp[j] + 1
      end
    end
    p dp
    dp
  end

  def longest_decrease_array_len(nums)
    n = nums.size - 1
    dp = Array.new(nums.size, 1)

    n.downto(0).each do |i|
      n.downto(i).each do |j|
        dp[i] = dp[j] + 1 if nums[i] > nums[j] && dp[i] < dp[j] + 1
      end
    end
    p dp
    dp
  end
end

mmr = MinimumMountainRemovals.new
# p mmr.minimum_mountain_removals([2,1,1,5,6,2,3,1])
# p mmr.minimum_mountain_removals([1,2,3,4,4,3,2,1])
p mmr.minimum_mountain_removals([1,3,1])
# p mmr.minimum_mountain_removals([1,16,84,9,29,71,86,79,72,12])
