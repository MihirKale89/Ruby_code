class TreeNode
  attr_accessor :left, :right, :data, :height, :bal

  def initialize
    @data = nil
    @left = nil
    @right = nil
    @height = -1
    @bal = nil
  end
end

class BinarySearchTree
  attr_accessor :root, :foundImbalancedNode, :deepestUnbalancedNode, :foundSearchElement

  def initialize
    @root = TreeNode.new
    @foundImbalancedNode = false
    @foundSearchElement = false
    @deepestUnbalancedNode = nil
  end

  def insertAndBalance(data, node=@root)
    insert(data)
    balanceBSTIfRequired(data)
  end

  def insert(data, node=@root)
    if node.data.nil?
      # node = TreeNode.new
      node.data = data
      # puts "This was called"
    elsif data < node.data
      if node.left.nil?
        node.left = TreeNode.new
        node.left.data = data
      else
        insert(data, node.left)
      end
    elsif data > node.data
      if node.right.nil?
        node.right = TreeNode.new
        node.right.data = data
      else
        insert(data, node.right)
      end
    else puts "The element #{data} already exists in the BST."
    end
  end

  def balanceBSTIfRequired(x, r = @root)
    balancing_required = !checkBal
    if balancing_required
      findDeepestUnbalancedNode
      # puts "The deepest Unbalanced Node is #{@deepestUnbalancedNode.data}"
      balanceBST(x, r)
      @deepestUnbalancedNode = nil
    end
  end

  def balanceBST(x, r = @root)
    unless (r == nil || @deepestUnbalancedNode == nil)
      # r = balanceAction(x, r)
      if !r.nil?
        if !r.left.nil? && r.left.data == @deepestUnbalancedNode.data
          r.left = balanceAction(x, r.left)
          @deepestUnbalancedNode = nil
        elsif !r.right.nil? && r.right.data == @deepestUnbalancedNode.data
          r.right = balanceAction(x, r.right)
          @deepestUnbalancedNode = nil
        elsif r.data == @deepestUnbalancedNode.data
          # puts "Checking whether balanceAction was called on root."
          # puts "Checking root data #{r.data}"
          tree_clone = r.clone
          tree_clone = balanceAction(x, tree_clone)
          @root = tree_clone
          @deepestUnbalancedNode = nil
        end
      end
      balanceBST(x, r.left)
      balanceBST(x, r.right)
    end
  end

  def balanceAction(x, r = @root)
    if ((findHeight( r.left ) - findHeight( r.right ) == 2) && r.left != nil && r.left.bal)
      if (r.left.data != nil && x < r.left.data)
        r = rotateWithLeftChild(r)
      else
        r = doubleWithLeftChild(r)
      end
      return r
    elsif ((findHeight( r.right ) - findHeight( r.left ) == 2) && r.right !=nil && r.right.bal)
      if (r.right.data != nil && x > r.right.data)
        r = rotateWithRightChild(r)
      else
        r = doubleWithRightChild(r)
      end
      return r
    else
      return r
    end
  end

  # Rotate binary tree node with left child
  def rotateWithLeftChild(k2)
    k1 = k2.left
    k2.left = k1.right
    k1.right = k2
    return k1
  end


  # Rotate binary tree node with right child
  def rotateWithRightChild(k1)
    # puts "Checking the data for rotateWithRightChild #{k1.data}"
    k2 = k1.right
    k1.right = k2.left
    k2.left = k1
    return k2
  end

  #   Double rotate binary tree node: first left child
  #   with its right child then node k3 with new left child
  def doubleWithLeftChild(k3)
    k3.left = rotateWithRightChild(k3.left)
    rotateWithLeftChild(k3)
  end

  # Double rotate binary tree node: first right child
  # with its left child then node k1 with new right child
  def doubleWithRightChild(k1)
    k1.right = rotateWithLeftChild(k1.right)
    rotateWithRightChild(k1)
  end
  # Function to max of left/right node
  def max(lhs, rhs)
    return lhs > rhs ? lhs : rhs
  end

  def findHeight(r = @root)
    if r.nil?
      return -1
    else
      r.height = max( findHeight( r.left ), findHeight( r.right ) ) + 1
    end
    return r.height
  end

  def checkBal(r = @root)
    @foundImbalancedNode = false
    return checkBalance(r)
  end

  def checkBalance(r = @root)
    if r.nil?
      # Do nothing
    else
      r.bal = (findHeight( r.left ) - findHeight( r.right )).abs < 2
      if r.bal == false
        @foundImbalancedNode = true
      end
    end
    if (r != nil)
      checkBalance(r.left)
      # print ("The balance for node #{r.data} is : #{r.bal} \n")
      checkBalance(r.right)
    end
    return !@foundImbalancedNode
  end

  def findDeepestUnbalancedNode(r = @root)
    unless (r == nil)
      if r.bal == false
        r.height = findHeight(r)
        if @deepestUnbalancedNode.nil?
          @deepestUnbalancedNode = r.clone
          # @deepestUnbalancedNode.height = findHeight(r)
        else
          # puts "Checking if @deepestUnbalancedNode was compared with other nodes "
          if r.height < @deepestUnbalancedNode.height
            @deepestUnbalancedNode = r.clone
          end
        end
      end
      findDeepestUnbalancedNode(r.left)
      findDeepestUnbalancedNode(r.right)
    end
  end

  def deleteElement(data, r = @root)
    searchElem(data)
    if @foundSearchElement
      @foundSearchElement = false
      deleteElem(data, r = @root)
      puts "The element #{data} is deleted from the BST."
    else
      puts "The element #{data} does not exist in the BST. Therefore, it cannot be deleted."
    end
    @foundSearchElement = false
  end

  def deleteElem(data, r = @root)
    unless (r == nil || @foundSearchElement == true)
      deleteElem(data, r.left)
      deleteElem(data, r.right)
      if data == r.data
        if (r.right != nil && r.left != nil)
          minOnRight = findMin(r.right)
          deleteElem(minOnRight, r.right)
          replaceElement(data, minOnRight)
        end
        if (r.right == nil && r.left != nil)
          k = r.left.clone
          # r = TreeNode.new
          replaceSubTree(data, k, @root)
        end
        if (r.right != nil && r.left == nil)
          k = r.right.clone
          # r = TreeNode.new
          replaceSubTree(data, k, @root)
        end
        if (r.right == nil && r.left == nil)
          replaceSubTree(data, nil, @root)
        end
        @foundSearchElement = true
      end
    end
  end

  def replaceSubTree(oldData, subTree, r = @root)
    if oldData == @root.data
      @root = subTree
    else
      tree_clone = @root.clone
      @root = replaceSubTr(oldData, subTree, tree_clone)
      # if @foundSearchElement
      #   if subTree.nil?
      #     puts "The element #{oldData} was found in the BST and replaced with nil."
      #   else
      #     puts "The element #{oldData} was found in the BST and replaced with subTree #{subTree.data}."
      #   end
      # else
      #   puts "The element #{oldData} does not exist in the BST."
      # end
      @foundSearchElement = false
    end
  end

  def replaceSubTr(oldData, subTree, r = @root)
    unless (r == nil || @foundSearchElement == true)
      if !r.left.nil? && oldData == r.left.data
        r.left = subTree
        @foundSearchElement = true
      end
      if !r.right.nil? && oldData == r.right.data
        r.right = subTree
        @foundSearchElement = true
      end
      if !r.nil?
        replaceSubTr(oldData, subTree, r.left)
      end
      if !r.nil?
        replaceSubTr(oldData, subTree, r.right)
      end
    end
    return r
  end

  def findMin(r = @root)
    min = r.nil? ? nil : r
    while !min.nil? && min.left != nil
      min = min.left
    end
    # puts "The min found is #{min.data}"
    return min.nil? ? nil : min.data
  end

  def findMax(r = @root)
    max = r.nil? ? nil : r
    while !max.nil? && max.right != nil
      max = max.right
    end
    # puts "The max found is #{max.data}"
    return max.nil? ? nil : max.data
  end

  def replaceElement(oldData, newData)
    if oldData == @root.data
      @root.data = newData
    else
      tree_clone = @root.clone
      @root = replaceElem(oldData, newData, tree_clone)
      # if @foundSearchElement
      #   puts "The element #{oldData} was found in the BST and replaced with #{newData}."
      # else
      #   puts "The element #{oldData} does not exist in the BST."
      # end
      @foundSearchElement = false
    end
  end

  def replaceElem(oldData, newData, r = @root)
    unless (r == nil || @foundSearchElement == true)
      if !r.left.nil? && oldData == r.left.data
        r.left.data = newData
        @foundSearchElement = true
      end
      if !r.left.nil? && oldData == r.right.data
        r.right.data = newData
        @foundSearchElement = true
      end
      replaceElem(oldData, newData, r.left)
      replaceElem(oldData, newData, r.right)
    end
    return r
  end

  def searchElement(data, r = @root)
    searchElem(data)
    if @foundSearchElement
      puts "The element #{data} exists in the BST."
    else
      puts "The element #{data} does not exist in the BST."
    end
    @foundSearchElement = false
  end

  def searchElem(data, r = @root)
    unless (r == nil || @foundSearchElement == true)
      searchElem(data, r.left)
      searchElem(data, r.right)
      if data == r.data
        # found = true
        @foundSearchElement = true
      end
    end
  end

  def inorderBST(r = @root)
    unless (r == nil)
      inorderBST(r.left)
      print ("#{r.data} ")
      inorderBST(r.right)
    end
  end

  def preorderBST(r = @root)
    if (r != nil)
      print("#{r.data} ")
      preorderBST(r.left)
      preorderBST(r.right)
    end
  end

  def postorderBST(r = @root)
    if (r != nil)
      postorderBST(r.left)
      postorderBST(r.right)
      print("#{r.data} ")
    end
  end
end

# bst = BinarySearchTree.new
# puts "BST means Binary Search Tree"
# bst.insert(21)
# bst.insert(26)
# bst.insert(30)
# bst.insert(9)
# bst.insert(4)
# bst.insert(14)
# bst.insert(28)
# bst.insert(18)
# bst.insert(15)
# bst.insert(10)
# bst.insert(2)
# bst.insert(3)
# bst.insert(7)
# print "\n Inorder BST: "
# bst.inorderBST
# print "\n Preorder BST: "
# bst.preorderBST
# print "\n Postorder BST: "
# bst.postorderBST
# puts "\n"
# puts "The height of the BST is #{bst.findHeight}"
# puts "The height of the left of BST is #{bst.findHeight(bst.root.left)}"
# puts "The height of the right of BST is #{bst.findHeight(bst.root.right)}"
# puts "\n"
# puts "Searching element 15 "
# bst.searchElement(15)
# bst.searchElement(17)
# puts "Checking if BST is balanced : #{bst.checkBal ? "Yes" : "No"}"
# puts "\n"

puts "BBST means Balanced Binary Search Tree"
bbst = BinarySearchTree.new
bbst.insertAndBalance(21)
bbst.insertAndBalance(26)
bbst.insertAndBalance(30)
bbst.insertAndBalance(9)
bbst.insertAndBalance(4)
bbst.insertAndBalance(14)
bbst.insertAndBalance(28)
bbst.insertAndBalance(18)
bbst.insertAndBalance(15)
bbst.insertAndBalance(10)
bbst.insertAndBalance(2)
bbst.insertAndBalance(3)
bbst.insertAndBalance(7)

print "\n Inorder BBST: "
bbst.inorderBST
print "\n Preorder BBST: "
bbst.preorderBST
print "\n Postorder BBST: "
bbst.postorderBST
puts "\n"
puts "The height of the BBST is #{bbst.findHeight}"
puts "The height of the left of BBST is #{bbst.findHeight(bbst.root.left)}"
puts "The height of the right of BBST is #{bbst.findHeight(bbst.root.right)}"
puts "\n"
puts "Checking if BBST is balanced : #{bbst.checkBal ? "Yes" : "No"}"
# bst.checkBalance
puts "\n"
bbst.searchElement(15)
bbst.searchElement(17)
# bbst.deleteElement(15)
puts "The minimum element in the BBST is #{bbst.findMin}"
puts "The maximum element in the BBST is #{bbst.findMax}"
bbst.deleteElement(2)
bbst.deleteElement(15)
bbst.deleteElement(17)
bbst.deleteElement(14)
bbst.deleteElement(28)
bbst.deleteElement(10)
bbst.deleteElement(7)
bbst.deleteElement(4)
print "\n Inorder BBST: "
bbst.inorderBST
print "\n Preorder BBST: "
bbst.preorderBST
print "\n Postorder BBST: "
bbst.postorderBST
puts "\n"
puts "The height of the BBST is #{bbst.findHeight}"
puts "The height of the left of BBST is #{bbst.findHeight(bbst.root.left)}"
puts "The height of the right of BBST is #{bbst.findHeight(bbst.root.right)}"
puts "\n"
puts "Checking if BBST is balanced : #{bbst.checkBal ? "Yes" : "No"}"
