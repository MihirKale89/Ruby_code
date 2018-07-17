class SBBSTNode
  attr_accessor :left, :right, :data, :height

  def initialize(d)
    @left = nil
    @right = nil
    @data = d
    @height = 0
  end
end

class SelfBalancingBinarySearchTree
  attr_accessor :root
  def initialize
   @root = nil
  end

  # def initialize(root_val = nil)
  #   @root = SBBSTNode.new(root_val) unless root_val.nil?
  # end
  # Function to check if tree is empty
  def isEmpty
    return @root.nil?
  end

  # Make the tree logically empty
  def clear
    @root = nil
  end

  # Function to insert data
  def insert(data)
    @root = insertInBST(data, @root)
  end

  # Function to get height of node
  def height(t)
    return t.nil? ? -1 : t.height
  end

  # Function to max of left/right node
  def max(lhs, rhs)
    return lhs > rhs ? lhs : rhs
  end

  # Function to insert data recursively
  def insertInBST(x, t)
    if (t.nil?)
      t = SBBSTNode.new(x)
      puts "This was executed"
    elsif (x < t.data)
      t.left = insertInBST( x, t.left )
      if (height( t.left ) - height( t.right ) == 2)
        if (x < t.left.data)
          t = rotateWithLeftChild(t)
        else
          t = doubleWithLeftChild(t)
        end
      end
    elsif (x > t.data)
      t.right = insertInBST( x, t.right )
      if (height( t.right ) - height( t.left ) == 2)
        if (x > t.right.data)
          t = rotateWithRightChild( t )
        else
          t = doubleWithRightChild( t )
        end
      end
    else
       t.height = max( height( t.left ), height( t.right ) ) + 1
       return t
    end
  end
  # Rotate binary tree node with left child
  def rotateWithLeftChild(k2)
    k1 = k2.left
    k2.left = k1.right
    k1.right = k2
    k2.height = max( height( k2.left ), height( k2.right ) ) + 1
    k1.height = max( height( k1.left ), k2.height ) + 1
    return k1
  end


  # Rotate binary tree node with right child
  def rotateWithRightChild(k1)
    k2 = k1.right
    k1.right = k2.left
    k2.left = k1
    k1.height = max( height( k1.left ), height( k1.right ) ) + 1
    k2.height = max( height( k2.right ), k1.height ) + 1
    return k2
  end

  #   Double rotate binary tree node: first left child
  #   with its right child then node k3 with new left child
  def doubleWithLeftChild(k3)
    k3.left = rotateWithRightChild(k3.left)
    return rotateWithLeftChild(k3)
  end

  # Double rotate binary tree node: first right child
  # with its left child then node k1 with new right child
  def doubleWithRightChild(k1)
    k1.right = rotateWithLeftChild(k1.right)
    return rotateWithRightChild(k1)
  end

  # Functions to count number of nodes
  def countNodes()
    return countNodesOfBST(@root)
  end

  def countNodesOfBST(r)
    if (r.nil?)
      return 0
    else
      l = 1
      l += countNodesOfBST(r.left)
      l += countNodesOfBST(r.right)
      return l
    end
  end

  # Functions to search for an element
  def search(val)
    return searchBST(@root, val)
  end

  def searchBST(r, val)
    found = false
    while ((r != nil) && !found) do
      rval = r.data
      if (val < rval)
        r = r.left
      elsif (val > rval)
        r = r.right
      else
        found = true
        break
      end
      found = searchBST(r, val)
    end
    return found
  end

  # Function for inorder traversal */
  def inorder()
    inorderBST(@root)
  end

  def inorderBST(r)
    if (r != nil)
      inorderBST(r.left)
      puts("#{r.data} ")
      inorderBST(r.right)
    end
  end

  # Function for preorder traversal
  def preorder()
    preorderBST(@root)
  end

  def preorderBST(r)
    if (r != nil)
      puts("#{r.data} ")
      preorderBST(r.left)
      preorderBST(r.right)
    end
  end

  # Function for postorder traversal */
  def postorder()
    postorderBST(@root)
  end

  def postorderBST(r)
    if (r != nil)
      postorderBST(r.left)
      postorderBST(r.right)
      puts("#{r.data} ")
    end
  end

end


sbbst = SelfBalancingBinarySearchTree.new
sbbst.insert(10)
sbbst.insert(12)
sbbst.insert(14)
puts("\nPost order : ")
sbbst.postorder()
puts("\nPre order : ")
sbbst.preorder()
puts("\nIn order : ")
sbbst.inorder()
puts("Nodes = #{sbbst.countNodes()}")
puts("Empty status = #{sbbst.isEmpty()}")
puts("\nTree Cleared")
sbbst.clear()

# puts("SelfBalancingBinarySearchTree Test")
#  Perform tree operations
# loop do
#   puts("\nSelfBalancingBinarySearchTree Operations\n")
#   puts("1. insert ")
#   puts("2. search")
#   puts("3. count nodes")
#   puts("4. check empty")
#   puts("5. clear tree")
#
#   choice = gets.chomp.to_i
#   case choice
#   when 1
#     puts("Enter integer element to insert")
#     sbbst.insert(gets.chomp.to_i)
#   when 2
#     puts("Enter integer element to search")
#     puts("Search result : #{sbbst.search( gets.chomp.to_i)}")
#   when 3
#     puts("Nodes = #{sbbst.countNodes()}")
#   when 4
#     puts("Empty status = #{sbbst.isEmpty()}")
#   when 5
#     puts("\nTree Cleared")
#     sbbst.clear()
#   else
#     puts("Wrong Entry \n ")
#   end
#
#   puts("\nPost order : ")
#   sbbst.postorder()
#   puts("\nPre order : ")
#   sbbst.preorder()
#   puts("\nIn order : ")
#   sbbst.inorder()
#
#   puts("\nDo you want to continue (Type y or n) \n")
#   ch = gets.chomp
#   break unless (ch == "Y"|| ch == "y")
# end
