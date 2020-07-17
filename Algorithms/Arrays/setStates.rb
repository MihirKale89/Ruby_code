def cellCompete(states, days)
    # WRITE YOUR CODE HERE
    days.times do
      copy = []
      copy.replace(states)
      states[0] = copy[1] == 0 ? 0 : 1
      states[-1] = copy[-2] == 0 ? 0 : 1
      for i in (1...states.length-1)
        states[i] = copy[i-1] == copy[i+1] ? 0 : 1
      end
    end
    states
end

p cellCompete([1,0,0,0,0,1,0,0],1)
