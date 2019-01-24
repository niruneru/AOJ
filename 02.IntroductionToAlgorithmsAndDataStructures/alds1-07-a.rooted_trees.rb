# -- input
# -- 13
# -- 0 3 1 4 10
# -- 1 2 2 3
# -- 2 0
# -- 3 0
# -- 4 3 5 6 7
# -- 5 0
# -- 6 0
# -- 7 2 8 9
# -- 8 0
# -- 9 0
# -- 10 2 11 12
# -- 11 0
# -- 12 0
# -- -------------------------
# -- output
# -- node 0: parent = -1, depth = 0, root, [1, 4, 10]
# -- node 1: parent = 0, depth = 1, node, [2, 3]
# -- ...
# -- ---------------------------------------------------------

class Node
  attr_accessor :parent, :left, :right, :chlds

  def initialize(p, l, r, *chs)
    @parent = p
    @left   = l
    @right  = r
    @chlds  = chs
  end
end

def getDepth(k, d, node)
  if node[k].parent == -1
      d
  else
     getDepth(node[k].parent, d+1, node)
  end
end

def getKubun(k, nodes)
  if nodes[k].parent == -1
    "root"
  elsif nodes[k].left != nil
    "internal node"
  else
    "leaf"
  end
end

nodes = {}
n = gets.chomp.to_i

n.times {
  key, z, *chs = gets.chomp.split.map(&:to_i)

  if nodes[key] == nil
    nodes[key] = Node.new(-1, chs[0], nil, chs)
  else
      nodes[key].left = chs[0]
      nodes[key].chlds = chs
  end

  #-- 子要素について、parentとrightをセット
  chs.each_with_index { |ch, i|
    #-- parentのセット
    if nodes[ch] == nil
      nodes[ch] = Node.new(key, nil, nil, nil)
    else
      nodes[ch].parent = key
    end

    #-- rightのセット
    if i != chs.length - 1
      nodes[ch].right = chs[i + 1]
    end
  }
}

#-- 表示
[*0...n].each { |i|
  print "node #{i}: parent = #{nodes[i].parent}, depth = #{getDepth(i, 0, nodes)}, #{getKubun(i, nodes)}, "
  p nodes[i].chlds.flatten
}
