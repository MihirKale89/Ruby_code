# Given [1,2,3...n], find kth permutation
# Example
# [1,2,3]=> 123,132,213,231,312,321
# second permutation: 132, 5th permutation: 312

def get_permutation(n, k)
  nums = list(range(1, n+1))
  result = []

  def get_p_rec(nums, k, partial='')
    if not nums:
      result.append(partial)
      return partial
    count = factorial(len(nums)-1)
    selected = (k-1)//count
    k = k % count

    partial += str(nums[selected])
    del nums[selected]
    get_p_rec(nums, k ,partial) # How many times did it recur?

  get_p_rec(nums, k, '')
  return result[0]
