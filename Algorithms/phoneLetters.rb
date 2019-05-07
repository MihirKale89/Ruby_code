# @param {String} digits
# @return {String[]}
def letter_combinations(digits)
  result = Array.new
  return result if digits.nil? || digits.length == 0
  dict = Hash.new
  dict['2'] = "abc".chars
  dict['3'] = "def".chars
  dict['4'] = "ghi".chars
  dict['5'] = "jkl".chars
  dict['6'] = "mno".chars
  dict['7'] = "pqrs".chars
  dict['8'] = "tuv".chars
  dict['9'] = "wxyz".chars
  arr = Array.new(digits.length)
  helper(digits, 0, dict, result, arr)
  return result
end

def helper(digits, index, dict, result, arr)
  if index == digits.length
    result << arr.join
    return
  end
  candidates = dict[digits[index]]
  for i in 0...candidates.length
    arr[index] = candidates[i]
    helper(digits, index+1, dict, result, arr)
  end
end

p letter_combinations("23")
p letter_combinations("2")
#
# public List<String> letterCombinations(String digits) {
#     HashMap<Character, char[]> dict = new HashMap<Character, char[]>();
#     dict.put('2',new char[]{'a','b','c'});
#     dict.put('3',new char[]{'d','e','f'});
#     dict.put('4',new char[]{'g','h','i'});
#     dict.put('5',new char[]{'j','k','l'});
#     dict.put('6',new char[]{'m','n','o'});
#     dict.put('7',new char[]{'p','q','r','s'});
#     dict.put('8',new char[]{'t','u','v'});
#     dict.put('9',new char[]{'w','x','y','z'});
#
#     List<String> result = new ArrayList<String>();
#     if(digits==null||digits.length()==0){
#         return result;
#     }
#
#     char[] arr = new char[digits.length()];
#     helper(digits, 0, dict, result, arr);
#
#     return result;
# }
#
# private void helper(String digits, int index, HashMap<Character, char[]> dict,
#                         List<String> result, char[] arr){
#     if(index==digits.length()){
#         result.add(new String(arr));
#         return;
#     }
#
#     char number = digits.charAt(index);
#     char[] candidates = dict.get(number);
#     for(int i=0; i<candidates.length; i++){
#         arr[index]=candidates[i];
#         helper(digits, index+1, dict, result, arr);
#     }
# }
