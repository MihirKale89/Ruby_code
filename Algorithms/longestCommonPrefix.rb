# @param {String[]} strs
# @return {String}

class LongestCommonPrefix
  def longest_common_prefix(strs)
    return "" if strs.length == 0
    return strs[0] if strs.length == 1
    lengths = strs.map { |str| str.length }
    min_length = lengths[0]
    lengths.each { |len| min_length = len if min_length > len }
    lcp = ""
    (0..min_length-1).each do |index|
      ch = strs[0][index]
      isIdentical = true
      (1..strs.length-1).each do |strsindex|
        isIdentical = false if strs[strsindex][index] != ch
        break if !isIdentical
      end
      break if !isIdentical
      lcp += ch
    end
    return lcp
  end
end

l1 = LongestCommonPrefix.new
p l1.longest_common_prefix(["Hi", "Hello", "Howzyou"])
p l1.longest_common_prefix(["Flower", "Flow", "Flight"])
p l1.longest_common_prefix(["Dog", "Racecar", "Car"])
p l1.longest_common_prefix(["aca", "cba"])
