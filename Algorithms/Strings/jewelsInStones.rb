=begin

You're given strings J representing the types of stones that are jewels, and S representing the stones you have.
Each character in S is a type of stone you have.  You want to know how many of the stones you have are also jewels.

The letters in J are guaranteed distinct, and all characters in J and S are letters. Letters are case sensitive,
 so "a" is considered a different type of stone from "A".

Example 1:

Input: J = "aA", S = "aAAbbbb"
Output: 3
Example 2:

Input: J = "z", S = "ZZ"
Output: 0
Note:

S and J will consist of letters and have length at most 50.
The characters in J are distinct.

=end

class JewelsInStones
  def num_jewels_in_stones(j, s)
    num = 0
    s.each_char { |c| num+=1 if j.include? c }
    num
  end

  def num_jewels_in_stones_hash(j, s)
    h = {}
    j.each_char { |c| h[c] = 0 }
    s.each_char { |c| h[c]+=1 if h[c] }
    h.values.inject(0, :+)
  end
end

js = JewelsInStones.new
p js.num_jewels_in_stones("aA", "aAAbbbb")
p js.num_jewels_in_stones("z", "ZZ")
p js.num_jewels_in_stones_hash("aA", "aAAbbbb")
p js.num_jewels_in_stones_hash("z", "ZZ")
