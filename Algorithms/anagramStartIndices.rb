# @param {String} s
# @param {String} p
# @return {Integer[]}
def find_anagrams(s, p)
  result = Array.new
  return result if s.length < p.length
  pcharCountArray = Array.new(26, 0)
  p.each_char { |chr| pcharCountArray[chr.ord-97]+= 1 }
  scharCountArray = Array.new(26, 0)
  s = s.chars
  s[0..p.length-1].each { |chr| scharCountArray[chr.ord-97]+= 1 }
  result << 0 if pcharCountArray == scharCountArray
  for index in 1..s.length-p.length
    scharCountArray[s[index-1].ord-97]-= 1
    scharCountArray[s[index+p.length-1].ord-97]+= 1
    result << index if pcharCountArray == scharCountArray
  end
  result
end

p find_anagrams("cbaebabacd", "abc")
