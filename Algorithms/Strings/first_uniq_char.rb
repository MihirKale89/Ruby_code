class FirstUniqChar
  def first_uniq_char(s)
    # h = {}
    # s.chars.each do |ch|
    #   h[ch] = h[ch].nil? ? true : false
    # end
    # hash = a.inject(Hash.new(0)) { |h, e| h[e] +=1; h }
    h = s.chars.each_with_object({}) { |e, h| h[e] = h[e].nil? ? true : false }
    p h
    ch = h.key(true)
    ch ? s.chars.index(ch) : -1
  end
end

fc = FirstUniqChar.new
p fc.first_uniq_char('leetcode')
