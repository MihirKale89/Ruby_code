=begin

We are given some website visits: the user with name username[i] visited the
website website[i] at time timestamp[i].

A 3-sequence is a list of websites of length 3 sorted in ascending order by the
 time of their visits.  (The websites in a 3-sequence are not necessarily distinct.)

Find the 3-sequence visited by the largest number of users. If there is more
than one solution, return the lexicographically smallest such 3-sequence.



Example 1:

Input: username = ["joe","joe","joe","james","james","james","james","mary",
"mary","mary"], timestamp = [1,2,3,4,5,6,7,8,9,10],
website = ["home","about","career","home","cart","maps","home","home","about",
"career"]
Output: ["home","about","career"]
Explanation:
The tuples in this example are:
["joe", 1, "home"]
["joe", 2, "about"]
["joe", 3, "career"]
["james", 4, "home"]
["james", 5, "cart"]
["james", 6, "maps"]
["james", 7, "home"]
["mary", 8, "home"]
["mary", 9, "about"]
["mary", 10, "career"]
The 3-sequence ("home", "about", "career") was visited at least once by 2 users.
The 3-sequence ("home", "cart", "maps") was visited at least once by 1 user.
The 3-sequence ("home", "cart", "home") was visited at least once by 1 user.
The 3-sequence ("home", "maps", "home") was visited at least once by 1 user.
The 3-sequence ("cart", "maps", "home") was visited at least once by 1 user.


Note:

3 <= N = username.length = timestamp.length = website.length <= 50
1 <= username[i].length <= 10
0 <= timestamp[i] <= 10^9
1 <= website[i].length <= 10
Both username[i] and website[i] contain only lowercase characters.
It is guaranteed that there is at least one user who visited at least
3 websites.
No user visits two websites at the same time.

=end

require 'set'

class MostVisitedPattern
  def most_visited_pattern(username, timestamp, website)
    visits = username.zip(timestamp, website)
    p visits

    visits_by_user = visits.group_by(&:first)
    p visits_by_user
    p visits_by_user.class

    visits_by_user.each do |k, v|
        visits_by_user[k] = v.sort_by { |visit| visit[1] }.map(&:last)
    end

    p visits_by_user
    sequence_counts = Hash.new(0)
    histories = visits_by_user.values
    p sequence_counts
    p histories
    histories.each do |history|
        seen = Set.new
        (0...history.length).each do |i|
            (i+1...history.length).each do |j|
                (j+1...history.length).each do |k|
                    sequence = [history[i], history[j], history[k]]
                    next if seen.include? sequence

                    seen.add sequence
                    sequence_counts[sequence] += 1
                end
            end
        end
        p seen
    end

    p sequence_counts

    most_common_sequences = sequence_counts
        .group_by { |k, v| v }
        .sort_by {|k, v| k }
        .last
        .last
        .map(&:first)
    most_common_sequences.sort.first
  end
end

mvp = MostVisitedPattern.new
username = ["joe","joe","joe","james","james","james","james","mary",
"mary","mary"]
timestamp = [1,2,3,4,5,6,7,8,9,10]
website = ["home","about","career","home","cart","maps","home","home","about",
"career"]
p mvp.most_visited_pattern(username, timestamp, website)
