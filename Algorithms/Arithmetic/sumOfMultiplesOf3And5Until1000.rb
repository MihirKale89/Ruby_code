class SumOFMultiplesOf3And5Until1000
  # Assuming we need the sum of multiples greater than 0
  def findSum
    sum = 0
    for num in 1..1000 do
      if (num%3 == 0 || num%5 == 0)
        sum = sum + num
        # puts "Num is #{num}"
        # puts "Sum is #{sum}"
      end
    end
    puts " The sum of all multiples of 3 and 5 between 1 and 1000 is #{sum}."
  end
end

sumFinder = SumOFMultiplesOf3And5Until1000.new
sumFinder.findSum
