class Node
    attr_accessor :parent, :left, :right
    def initialize(p, l, r)
        @parent = p
        @left = l
        @right = r
    end
end

def make_tree n
    tree = {}
    [*0...n].each do |i|
        tree[i] = Node.new(-1, nil ,nil)
    end

    n.times do
        k, l, r = gets.chomp.split.map(&:to_i)
        tree[k].left = l
        tree[k].right = r
        tree[l].parent = k if tree[l] != nil
        tree[r].parent = k if tree[r] != nil
    end
    tree
end

def preorder(i, tree)
    if i != -1
      print " #{i}"
      preorder(tree[i].left, tree)
      preorder(tree[i].right, tree)
    end
end

def inorder(i, tree)
    if i != -1
        inorder(tree[i].left, tree)
        print " #{i}"
        inorder(tree[i].right, tree)
    end
end

def postorder(i, tree)
    if i != -1
      postorder(tree[i].left, tree)
      postorder(tree[i].right, tree)
      print " #{i}"
    end
end

n = gets.chomp.to_i
tree = make_tree(n)
root = -1

tree.each do |(k, v)|
    root = k if v.parent == -1
end

puts "Preorder"; preorder(root, tree); puts
puts "Inorder"; inorder(root, tree); puts
puts "Postorder"; postorder(root, tree); puts
