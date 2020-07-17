=begin
 Fill up an imaginary 2-D (1-indexed) array with all zeros.
 Given a string array, each element contains +ve row and +ve column count.
 For each row from 1 to row and for each column from 1 to column, add 1.
 Return the occurances of max_element in the 2 d array.
=end

class Growing2DArray
  def growing2DArray(arr)
    hsh = Hash.new
    arr.each do |rc|
      rc = rc.split.map(&:to_i)
      (1..rc[0]).each do |r|
        hsh[r] = [] unless hsh[r]
        if hsh[r].empty?
          hsh[r][0] = 1
          hsh[r][1] = rc[1]
        else
          hsh[r][0]+=1
          hsh[r][1] = rc[1] if rc[1] < hsh[r][1]
        end
      end
    end
    max_val = 0
    hsh.values.each { |v| max_val = v[0] if v[0] > max_val }
    max_count = 0
    hsh.values.each { |v| max_count+=v[1] if v[0] == max_val }
    max_count
  end
end

ga = Growing2DArray.new
p ga.growing2DArray(["1 4","2 3","4 1"])
