# This was the third question. We had to return the max difference with lower indexed elements of lower value
# in any given integer array. We had to return -1 if lower indexed smaller values were not available.

def maxDiff(arr)
  return -1 if (arr.length < 2)
  min_arr = []
  diff_arr = []
  min = arr[0]
  for i in 1..arr.length-1
    min = min < arr[i-1] ? min : arr[i-1]
    min_arr << min
    diff_arr << arr[i] - min
  end
  return findMax(diff_arr)
end

def findMax(arr)
  max = arr[0]
  for i in 1..arr.length-1
    max = max > arr[i] ? max : arr[i]
  end
  return max > 0 ? max : -1
end

p maxDiff([7,6,2,4])
p maxDiff([-2,-4,-6,-8])
p maxDiff([-2,-2,-2,-2])
