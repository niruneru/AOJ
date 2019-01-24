class Node
    attr_accessor :parent, :left, :right
    
    def initialize(parent, left, right)
        @parent = parent
        @left   = left
        @right  = right
    end
end

def sibling(key, nodes)
    p = nodes[key].parent
    if p != -1
        if nodes[p].left == key
            nodes[p].right
        else
            nodes[p].left
        end
    else
        -1
    end
end

def degree(key, nodes)
    if nodes[key].left != -1 && nodes[key].right != -1
        2
    elsif nodes[key].left != -1 || nodes[key].right != -1
        1
    else
        0
    end
end

def depth(key, nodes)
    depth = 0
    i = key
    while nodes[i].parent != -1
        depth += 1
        i = nodes[i].parent
    end
    depth
end

def height(key, nodes)
    left_h = right_h = 0
    if nodes[key].left != -1
        left_h = 1 + height(nodes[key].left, nodes)
    end

    if nodes[key].right != -1
        right_h = 1 + height(nodes[key].right, nodes)
    end
    left_h > right_h ? left_h : right_h
end

def kind(key, nodes)
    if nodes[key].parent == -1
        "root"
    elsif nodes[key].left == -1 && nodes[key].right == -1
        "leaf"
    else
        "internal node"
    end
end

nodes = {}
n = gets.chomp.to_i
n.times{
    k, l, r = gets.chomp.split.map(&:to_i)
    if nodes[k] != nil
        nodes[k].left = l
        nodes[k].right = r
    else
        nodes[k] = Node.new(-1, l, r)
    end

    #-- left格納
    if l != -1 && nodes[l] != nil
        nodes[l].parent = k
    elsif l != -1
        nodes[l] = Node.new(k, -1 , -1)
    end
    
    #-- right格納
    if r != -1 && nodes[r] != nil
        nodes[r].parent = k
    elsif r != -1
        nodes[r] = Node.new(k, -1, -1)
    end
}

[*0...n].each do |i|
    print "node #{i}: parent = #{nodes[i].parent}"
    print ", sibling = #{sibling(i, nodes)}"
    print ", degree = #{degree(i, nodes)}"
    print ", depth = #{depth(i, nodes)}"
    print ", height = #{height(i, nodes)}"
    puts  ", #{kind(i, nodes)}"
end

#-- require 'minitest/autorun'
#-- class TestBinTree < Minitest::Test
  #-- def test_height
    #-- require 'byebug'; byebug
    #-- assert_equal 3, height(0, @@nodes)
  #-- end
#-- end
