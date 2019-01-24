#-- deleteについて
#-- 消したいノードが子を持たないなら、単にそれを消せばいい
#-- 右の子のみ、左の子のみならそれぞれをそのまま使えばよい
#-- 両方の子を持つ場合、左の木の最大値or右の木の最小値を探して
#-- 消したいノードの値と替える。探し出した最大値or最小値を持つノードが
#-- 子ノード（このとき最大値だったなら右の子は持たないし、
#-- 最小値だったら、左の子は持たない。）を持つならそれを親の子にする。
#-----------------------------------------------------------------------
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

def find(x, tree)
    if tree == nil then
        false
    elsif x < tree.key
        find(x, tree.left)
    elsif x > tree.key
        find(x, tree.right)
    else
        true
    end
end

def delete(x, tree)
    ps = []
    xs = []

    #-- 削除対象のノードにあたるまで下る。(下りながら方向と残りを保存。)
    while x != tree.key
        if x < tree.key
            tree, ps, xs = goleft(tree, ps, xs)
        else
            tree, ps, xs = goright(tree, ps, xs)
        end
    end

    #-- 削除対象のノードまでついたら部分木を作り直す
    tree = minswap(tree)

    #-- 木を再構成
    while ps != []
        tree, ps, xs = goup(tree, ps, xs)
    end

    tree
end

def minswap(tree)
    #-- treeの中のうち、根を除く最小値を探して、
    #-- それを根として再構成して返す。
    directions = []
    breadcrambs = []

    if tree.left == nil && tree.right != nil
        tree = tree.right
    elsif tree.left != nil && tree.right == nil
        tree = tree.left
    elsif tree.left != nil && tree.right != nil
        tree, directions, breadcrambs = goright(tree, directions, breadcrambs)
        while tree.left != nil
            tree, directions, breadcrambs = goleft(tree, directions, breadcrambs)
        end
        swapkey = tree.key
        tree = tree.right
        while directions != []
            tree, directions, breadcrambs = goup(tree, directions, breadcrambs)
        end
        tree.key = swapkey
    else
        tree = nil
    end

    tree
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
