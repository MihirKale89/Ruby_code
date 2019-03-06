# Given ['act', 'cat', 'toy','ant','yot','tab','can','bat']
# All strings are in lower case a to z
# Return [['act','cat'],['toy','yot'],['ant'],['tab','bat'],['can']]

class ClubAnagrams
  def clubAnagrams(arr)
    p arr
    countsHash= Hash.new
    arr.each do |str|
      charCountArray = Array.new(26, 0)
      str.each_char { |chr| charCountArray[chr.ord-97]+= 1 }
      if countsHash[charCountArray]
        countsHash[charCountArray] << str
      else
        countsHash[charCountArray] = Array.new
        countsHash[charCountArray] << str
      end
    end
    result_arr = Array.new
    countsHash.each do |key, value|
      result_arr << value
    end
    p result_arr
  end
end

ca = ClubAnagrams.new
ca.clubAnagrams(['act', 'cat', 'toy','ant','yot','tab','can','bat'])
