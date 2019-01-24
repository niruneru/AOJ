require 'minitest/autorun'
require './alds1-07-b.Binary-Tree.rb'

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

class Test < Minitest :: Test
    def test_height
        require 'byebug'; byebug
        assert height(0, node)
    end
end
