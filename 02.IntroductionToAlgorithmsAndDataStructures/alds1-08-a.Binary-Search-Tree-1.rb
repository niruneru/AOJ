class Tree
    attr_accessor :key, :left, :right
    def initialize(k, l, r)
        @key   = k
        @left  = l
        @right = r
    end
end

def insert(x, tree)
    if tree == nil
        Tree.new(x, nil, nil)
    elsif x < tree.key
        Tree.new(tree.key, insert(x, tree.left), tree.right)
    elsif x > tree.key
        Tree.new(tree.key, tree.left, insert(x, tree.right))
    else
        tree
    end
end

def goleft(tree, directions, breadcrambs)
    rt = tree.left
    tree.left = nil
    directions << 'L'
    breadcrambs << tree
    [rt, directions, breadcrambs]
end

def goright(tree, directions, breadcrambs)
    rt = tree.right
    tree.right = nil
    directions << 'R'
    breadcrambs << tree
    [rt, directions, breadcrambs]
end

def goup(tree, directions, breadcrambs)
    d = directions[-1]
    xtree = breadcrambs[-1]
    if d == 'L' then xtree.left = tree
    else xtree.right = tree end
    [xtree, directions[0..-2], breadcrambs[0..-2]]
end

def preorder(tree)
    if tree != nil
        print " #{tree.key}"
        preorder(tree.left)
        preorder(tree.right)
    end
end

def inorder(tree)
    if tree != nil
        inorder(tree.left)
        print " #{tree.key}"
        inorder(tree.right)
    end
end

def postorder(tree)
    if tree != nil
        postorder(tree.left)
        postorder(tree.right)
        print " #{tree.key}"
    end
end

#-- main
#------------------------------------------
tree = nil
paths = []
breads = []

x = gets.chomp.to_i
x.times {
    cmd, n = gets.chomp.split
    case cmd
    when "insert"
        tree = insert(n.to_i, tree)
    when "find"
        if find(n.to_i, tree)
            puts "yes"
        else
            puts "no"
        end
    when "delete"
        tree = delete(n.to_i, tree)
    when "print"
        inorder(tree); puts
        preorder(tree); puts
    end
}
