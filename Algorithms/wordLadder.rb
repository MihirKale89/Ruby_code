# @param {String} begin_word
# @param {String} end_word
# @param {String[]} word_list
# @return {Integer}
def ladder_length(begin_word, end_word, word_list)
  return 0 unless word_list.include? end_word
  queue = begin_word.chars
  tmpList = word_list.clone
  while (!queue.empty?)

  end
end

public int ladderLength(String beginWord, String endWord, List<String> wordList) {
        boolean hasEndWord = false;
        for (String s : wordList) {
            if (s.equals(endWord)) {
                hasEndWord = true;
                break;
            }
        }
        if (!hasEndWord) {
            return 0;
        }
        Queue<String> queue = new ArrayDeque<>();
        List<String> tmpList = new LinkedList<>(wordList);
        queue.offer(beginWord);
        int result = 1;
        while (!queue.isEmpty()) {
            Queue<String> tmp = new ArrayDeque<>();
            result++;
            for (String word : queue) {
                if (canTransfer(word, endWord)) {
                    return result;
                }
                Iterator<String> iterator = tmpList.iterator();
                while (iterator.hasNext()) {
                    String w = iterator.next();
                    if (canTransfer(w, word)) {
                        iterator.remove();
                        tmp.add(w);
                    }
                }
            }
            queue = tmp;
        }
        return 0;
    }

    private boolean canTransfer(String word1, String word2) {
        if (word1.length() != word2.length()) {
            return false;
        }
        int diff = 0;
        for (int i = 0; i < word1.length(); i++) {
            if (word1.charAt(i) != word2.charAt(i)) {
                diff++;
            }
        }
        return diff == 1;
    }
