# Include libs: Rspec

# puts 'Hello, world!'


#
# Old Content below(Python 2):
#
# =begin
# /*
#  Given an array "edges" of the form [[parent, child], [parent, child], ...],
#  write a function depsort(edges) that returns a single array of nodes sorted
#  such that any "child" must appear BEFORE its "parent". e.g.:
#   depsort([[1, 2], [2, 3], [2,  4]]) === [4, 3, 2, 1]  (Or [3, 4, 2, 1])
# */
# function depsort(edges) {
#   // TODO
# }
#
# console.log(depsort([ [1, 2], [2, 3], [2,  4] ]))
# [1,2],[3,4],[5,6]
#
# [1,2],[2,3],[2,4],[5,6][6,7][7,8][8,9]  === [3,4,9,8,7,6,2,1,5]

def sortEdges(parentChildArray)
    parents = Array.new
    children = Array.new
    roots = Array.new
    leaves = Array.new
    while parentChildArray.size > 0
      parentChildArray.each.map { |arr|
          parents << arr[0]
          children << arr[1]
      }
      (parents - children).each { |elem| roots << elem unless roots.include? elem }
      (children - parents).each { |elem| leaves << elem }
      parentChildArray.reject! { |elem| roots.include? elem[0] }
      # parentChildArray.reject! { |elem| leaves.include? elem[1] }
      parents.clear
      children.clear
    end
    resultArray = Array.new
    roots.reverse.each { |elem| resultArray << elem }
    leaves.each { |elem| resultArray.unshift elem unless resultArray.include? elem }
    resultArray
end

def sortEdges2(parentChildArray)
    parents = Array.new
    children = Array.new
    roots = Array.new
    leaves = Array.new
    while parentChildArray.size >= roots.size
      parentChildArray.each.map { |arr|
          parents << arr[0]
          children << arr[1]
      }
      (parents - children).each { |elem| roots << elem unless roots.include? elem }
      (children - parents).each { |elem| leaves << elem unless leaves.include? elem}
      # parentChildArray.reject! { |elem| roots.include? elem[0] }
      parentChildArray.reject! { |elem| leaves.include? elem[1] }
      parents.clear
      children.clear
    end
    resultArray = leaves
    roots.each { |elem| resultArray << elem unless resultArray.include? elem}
    resultArray
end

p sortEdges([[1, 2], [2, 3], [2,  4]])
p sortEdges([[1,2],[2,3],[2,4],[5,6],[6,7],[7,8],[1,5],[8,9]])
p sortEdges2([[1, 2], [2, 3], [2,  4]])
p sortEdges2([[1,2],[2,3],[2,4],[5,6],[6,7],[7,8],[1,5],[8,9]])
