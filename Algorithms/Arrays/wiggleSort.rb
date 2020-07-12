class WiggleSort
  def wiggle_sort(nums)
    nums = nums.sort
    limit = nums.length%2 == 0 ? nums.length/2 : nums.length/2+1
    for i in 1...limit
        x = nums.pop
        nums.insert(i*2-1, x)
    end
    p nums
  end
end

ws = WiggleSort.new
ws.wiggle_sort([3,5,2,1,6,4])
ws.wiggle_sort([3,5,2,1,6,4,7])
