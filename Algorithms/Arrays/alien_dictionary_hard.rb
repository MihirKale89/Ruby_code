class AlienDictionaryHard
  def valid_alien_dictionary(words)
    dict = Array.new(100, '')
    words.each do |word|
      (0...word.length).each do |i|
        next if dict[i][-1] == word[i]
        chars = dict[i].chars
        dict[i] += word[i] unless chars.include? word[i]
        puts "chars = #{chars} word[i] = #{word[i]}"
        # return '' if chars.include? word[i]
      end
    end

    res = ''
    # p dict
    dict.each do |word|
      word.chars.each do |ch|
        res += ch unless res.chars.include? ch
      end
    end
    res
  end
end

ad = AlienDictionaryHard.new
p ad.valid_alien_dictionary(%w[wrt wrf er ett rftt])
