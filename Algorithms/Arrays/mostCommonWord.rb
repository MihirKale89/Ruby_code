class MostCommonWord
  def most_common_word(paragraph, banned)
    paragraph = paragraph.downcase
    paragraph = paragraph.gsub(/[^a-z\s]/, ' ')
    paragraph = paragraph.split(' ')
    paragraph = paragraph - banned
    hsh = Hash.new(0)
    paragraph.each { |word| hsh[word]+=1 }
    hsh.key(hsh.values.max)
  end
end

mcw = MostCommonWord.new
paragraph = "Bob hit a ball, the hit BALL flew far after it was hit."
banned = ["hit"]
p mcw.most_common_word(paragraph, banned)
