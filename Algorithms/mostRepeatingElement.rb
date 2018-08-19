class MostRepeatingElement
  def mostRepeating(arr)
    return arr[0] if arr.length == 1
    uniqueElements = Hash.new
    uniqueElements.default = 0
    maxKey = arr[0]
    maxRep = 1
    arr.each.map { |num|
      uniqueElements[num] += 1
      if uniqueElements[num] > maxRep
        maxRep = uniqueElements[num]
        maxKey = num
      end
    }
    return maxKey
  end
end

mre = MostRepeatingElement.new
puts "The most repeating element is "+ mre.mostRepeating([1,2,3,4,5,6,5,5,4,5]).to_s
