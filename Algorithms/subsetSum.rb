class SubsetSum

  def subset_sum(numbers, target, partial=[])
    s = partial.inject 0, :+
  # check if the partial sum is equals to target

    #puts "sum(#{partial})=#{target}" if s == target
    if s == target
      str = ""
      partial.reverse.each { |e| str += e < 0 ? "- #{e.abs} " : "+ #{e} " }
      str[0..1] = '' if str[0] == '+'
      print str
      print " = #{target}\n"
    end

    return if s >= target # if we reach the number why bother to continue

    (0..(numbers.length - 1)).each do |i|
      n = numbers[i]
      remaining = numbers.drop(i+1)
      subset_sum(remaining, target, partial + [n])
    end
  end
end

nums = Array.new
(-5..5).each {|num| nums.push(num)}
ssm = SubsetSum.new
puts "Printing all combinations that sum up to 10"
ssm.subset_sum(nums,10)

# - Since the complexity of the algorithm in O 2^n. It takes very long to find all combinations adding up to 100.
# Therefore, I have solved the problem on a smaller range above.
# (-100..100).each {|num| nums.push(num)}
# puts "Printing all combinations that sum up to 100"
# ssm.subset_sum(nums,10)
