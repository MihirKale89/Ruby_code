# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}
def intersect(nums1, nums2)
  h1 = Hash.new(0)
  h2 = Hash.new(0)
  h3 = Hash.new(0)
  nums1.each do |e|
    h1[e] += 1
  end
  nums2.each do |e|
    h2[e] += 1
  end
  if h1.length > h2.length
    temp = h2
    h2 = h1
    h1 = temp
  end
  h1.each do |key, value|
    if h2[key] > 0
      h3[key] = [h1[key], h2[key]].min
    end
  end
  result = Array.new
  h3.each do |key, value|
    for i in 1..value
      result << key
    end
  end
  result
end

p intersect([4,9,5], [9,4,9,8,4])
