# Given [1,2,3] return [],[1],[2],[3],[1,2],[1,3],[2,3],[1,2,3]

def findAllSubsets(arr)
  result_arr = Array.new
  result_arr << []
  return result_arr if arr.empty?
  arr.each do |num|
    temp_arrs = Array.new
    result_arr.each { |ar| temp_arrs << (ar.clone << num) }
    temp_arrs.each { |ar| result_arr << ar }
  end
  result_arr
end

p findAllSubsets([])
p findAllSubsets([1])
p findAllSubsets([1,2])
p findAllSubsets([1,2,3])
# p findAllSubsets([1,2,3,3])
