class PartitionLabels
  def partition_labels(s)
    hash = Hash.new

    s.each_char.with_index do |char, idx|
      hash[char] ? hash[char][1] = idx : hash[char] = [] << idx
    end

	  # You might think this sort is nlogn, but in the grandscheme of things it's O(1)
    # Reason is because the hash could only have 26 elements at most due to being limited by alphabet
    # 26log(26) is nothing compared to what S could be if 500 wasn't the limit.

    partition = []
    min = max = 0
    hash.sort_by{|val| val[1]}.each do | char, interval|
        if interval[0] > max
            partition << (max-min + 1)
            min = interval[0]
            max = interval[1] ? interval[1] : min
        else
            min = interval[0] if interval[0] < min
            max = interval[1] if interval[1] && interval[1] > max
        end
    end

    partition << (max-min + 1)
  end
end

pl = PartitionLabels.new
# p pl.partition_labels("abc")
p pl.partition_labels("ababcbacadefegdehijhklij")
