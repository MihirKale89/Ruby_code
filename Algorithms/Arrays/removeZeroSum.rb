class RemoveZeroSum
  def remove_zero_sum(arr)
    retrun arr if arr.nil? || arr.size <= 1
    balance = counterbalance = 0
    dip_index = nil
    for i in 0...arr.length
      next unless arr[i]
      if arr[i] < 0
        # checking backwards
        balance += arr[i]*-1
        dip_index = i
        (dip_index-1).downto(0) do |j|
          counterbalance += arr[j]
          if counterbalance >= balance
            if counterbalance == balance
              arr[j..i] = nil
              balance = counterbalance = 0
            end
            break
          end
        end
      else
        counterbalance += arr[i]
        if counterbalance >= balance
          if counterbalance == balance
            arr[dip_index..i] = nil
            dip_index = nil
          end
          balance = counterbalance = 0
        end
      end
    end
    arr.compact
  end
end

rzs = RemoveZeroSum.new
p rzs.remove_zero_sum([1,2,-3,3,1])
p rzs.remove_zero_sum([1,4,-3,3,1])
