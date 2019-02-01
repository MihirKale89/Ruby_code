# Find number of contiguous sub arrays with exactly m odd numbers
class OddNumSubArrays
  def oddNumSubArrays(arr, m)
    odds = Array.new()
    arr.each_with_index do |num, index|
      odds << index if num%2 == 1
    end
    return -1 if odds.length < m
    subArrays = 0
    startIndex = start = last = 0
    while last != odds.last
      start = odds[startIndex]
      last = odds[startIndex+m-1]
      startEven = start == odds.first ? 0 : odds[startIndex-1] + 1
      lastEven = last == odds.last ? arr.length-1 : odds[startIndex+m] - 1
      subArrays += 1
      subArrays += (start-startEven)
      subArrays += (lastEven-last)
      if ((start-startEven) > 0 && (lastEven-last) > 0)
        subArrays = subArrays + ((start-startEven)*(lastEven-last))
      end
      startIndex += 1
    end
    return subArrays
  end
end
o = OddNumSubArrays.new
p o.oddNumSubArrays([2,3,4],1)
p o.oddNumSubArrays([2,3,4,5,6],2)
p o.oddNumSubArrays([2,4,6,3,8],1)
p o.oddNumSubArrays([0,5,0,5,0,0,1,0,0,1,0],2)
