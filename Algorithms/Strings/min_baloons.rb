# Given a string text, you want to use the characters of text to form as many instances of the t "balloon"
# as possible. You can use each character in text at most once.
# Return the maximum number of instances that can be formed.

class MinBaloons
  def max_number_of_balloons(text)
    h = text.chars.each_with_object(Hash.new(0)) { |e, h| h[e] += 1 if 'balon'.chars.include? e }
    %w[o l].each { |ch| h[ch] /= 2 }
    'balon'.chars - h.keys == [] ? h.values.min : 0
  end
end

mb= MinBaloons.new
p mb.max_number_of_balloons('nlaebolko')
