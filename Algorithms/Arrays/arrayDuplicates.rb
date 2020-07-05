class ArrayDuplicates
  def arrayDuplicates(arr)
    dups = Array.new()
    arr.each_with_index do |num, index|
      if (arr[(arr[index]).abs] >= 0)
        arr[(arr[index]).abs] = -arr[(arr[index]).abs]
      else
        dups << arr[index].abs
      end
    end
    return dups
  end
end

o = ArrayDuplicates.new
p o.arrayDuplicates([2,3,4,2])
p o.arrayDuplicates([2,3,4,5,6,3])
p o.arrayDuplicates([2,4,6,3,8,2])
p o.arrayDuplicates([0,0,0,0,0,1,0,0,1,0])
