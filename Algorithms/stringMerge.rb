# This was the first question. We had to merge 2 strings one character after the other.

def mergeStrings(a, b)
  return nil if a.nil? && b.nil?
  return b if a.nil? && !b.nil?
  return a if b.nil? && !a.nil?
  arr_a = a.chars
  arr_b = b.chars
  len = a.length < b.length ? a.length : b.length
  i = 0
  mergeStr = ""
  while (i < len)
    mergeStr += arr_a[i]
    mergeStr += arr_b[i]
    i += 1
  end
  arr_a[i..arr_a.length-1].map { |ch| mergeStr += ch } if i < a.length
  arr_b[i..arr_b.length-1].map { |ch| mergeStr += ch } if i < b.length
  return mergeStr
end

def mergeStrings2(a, b)
  return b if a.nil?
  return a if b.nil?
  len = a.length < b.length ? a.length : b.length
  mergeStr = ""
  (0..len-1).each do |i|
    mergeStr += a[i]
    mergeStr += b[i]
  end
  mergeStr += a[len..a.length-1] if len < a.length
  mergeStr += b[len..b.length-1] if len < b.length
  return mergeStr
end

p mergeStrings("abc", "def")
p mergeStrings("abc", "defghi")
p mergeStrings("abcxyz", "def")

p mergeStrings2("abc", "def")
p mergeStrings2("abc", "defghi")
p mergeStrings2("abcxyz", "def")
