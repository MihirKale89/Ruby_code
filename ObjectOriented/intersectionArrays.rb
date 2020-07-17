class IntersectionArrays
  def sort_intersection(arr1, arr2, arr3)
    # (arr1 & arr2 & arr3).sort

    res = []
    arr1.each do |e|
      res << e if arr2.include?(e) && arr3.include?(e)
    end
    res.sort
  end
end

ia = IntersectionArrays.new
p ia.sort_intersection([1,2,3,4,5],[1,2,5,7,9],[1,3,4,5,8])
