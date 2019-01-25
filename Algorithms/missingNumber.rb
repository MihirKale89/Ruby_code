class MissingNumber
  def missingNumber(arr)
    return 1 if arr.nil?
    return 3-arr[0] if arr.length == 1
    num = 0
    (1..arr.length+1).each { |index| num = num ^ index }
    arr.each { |elem| num = num ^ elem }
    p "The missing number in the array #{arr} is #{num}"
    num
  end
end

mn = MissingNumber.new
mn.missingNumber([2,3])
mn.missingNumber([1,2,3,5])
mn.missingNumber([1,2,3,4,6])
mn.missingNumber([1,3,4,5,6])
