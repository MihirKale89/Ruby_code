



# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
   sums = []
    nums.sort!

    for i in 0..(nums.length - 3)
        next if i > 0 && nums[i - 1] == nums[i]
        j = i + 1
        k = nums.length - 1
        while (j < k) do
            sum = nums[i] + nums[j] + nums[k]
            if sum > 0
                k -= 1
            elsif sum < 0
                j += 1
            else
                sums << [nums[i], nums[j], nums[k]]
                j += 1
                k -= 1
                j += 1 while nums[j] == nums[j - 1]
                k -= 1 while nums[k] == nums[k + 1]
                break if j >= k
            end
        end
    end

    return sums
end
