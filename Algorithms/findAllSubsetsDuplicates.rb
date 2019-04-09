# Given [1,2,3] return [],[1],[2],[3],[1,2],[1,3],[2,3],[1,2,3]

def findAllSubsetsDuplicates(arr)
  freqs = Hash.new 0
  arr.each{ |e| freqs[e]+= 1 }
  result_arr = Array.new
  result_arr << []
  return result_arr if arr.empty?
  freqs.each do |key, value|
    temp_arrs = Array.new
    for index in 1..value do
      result_arr.each do |ar|
        temp_arr = ar.clone
        for i in 1..index do
          temp_arr << key
        end
        temp_arrs << temp_arr
      end
    end
    temp_arrs.each{ |ar| result_arr << ar }
  end
  result_arr
end


p findAllSubsetsDuplicates([1,2,2])
p findAllSubsetsDuplicates([1,2,3,3])
