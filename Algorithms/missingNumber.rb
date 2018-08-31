class MissingNumber
  def missingNumber(arr)
    return 1 if arr.nil?
    return 3-arr[0] if arr.length == 1
    num = 1
    (2..arr.length+1).each { |index| num = num ^ index }
    # arr.each { |elem| num = num ^ elem }
    p "The missing number in the array #{arr} is #{num}"
    num
  end
end

mn = MissingNumber.new
p mn.missingNumber([1,3])
p mn.missingNumber([1,2,3,5])
p mn.missingNumber([1,2,3,4,6])
p mn.missingNumber([1,3,4,5,6])
