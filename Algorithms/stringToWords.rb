module NumbersToText

  def self.numbers_to_letters(string)
    numbers = string.split('+')
    dict = Hash.new
    for index in 1..26
      dict[index] = (index+64).chr
    end
    result = ''
    numbers.each do |num|
      nums = num.split(' ')
      nums.each do |n|
        result += dict[n.to_i].to_s
      end
      result += ' '
    end
    p result[0..result.length-2]
  end

end

puts NumbersToText.numbers_to_letters('16 18 5 22 1 9 12+8 5 1 12 20 8')
