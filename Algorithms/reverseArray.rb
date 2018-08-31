class ReverseArray
  def revArr(arr)
    front = 0
    rear = arr.length() - 1
    while front < rear
      temp = arr[front]
      arr[front] = arr[rear]
      arr[rear] = temp
      front += 1
      rear -= 1
    end
    arr
  end
end

ra = ReverseArray.new
p ra.revArr([2,3,4,5,6])
p ra.revArr([7,8,9])
p ra.revArr([9,8,7,6,5,4,3,2,1])
