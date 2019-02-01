#-- alds1-11-b Depth First Search
#--------------------------------------------------------------

#-- 未訪問のxの隣接ノード番号を返す。見つからないとnilを返す。
#--------------------------------------------------------------
def next_neighbor nodes, x
  nodes[x][:neighbors].each do |neighbor|
    if nodes[neighbor][:visit] == nil
        return neighbor
    end
  end 
  nil
end

#-- スタックが空になるまで探索
#--------------------------------------------------------------
def dfs stack, nodes, stamp
  if stack == []
    return [stack, nodes, stamp]
  end

  x = stack.last
  y = next_neighbor nodes, x
  stamp += 1

  if y == nil
  #-- y == nil -> 未訪問の隣接ノードがなくなった -> xをスタックから削除 して完了印
    stack.pop
    nodes[x][:fix] = stamp
  else
  #-- y == not nil -> 未訪問の隣接ノードが見つかった -> スタックへpushして訪問印
    stack.push y
    nodes[y][:visit] = stamp
  end

  dfs stack, nodes, stamp
end

#-- メイン処理
#-------------------
nodes = [] #-- 訪問時刻、完了時刻、隣接リストを持ったノードの配列
stack = [] #-- 訪問中のノードを格納するスタック
stamp = 0  #-- 訪問時刻

#-- 入力を受け取って自分の隣接リストを持つnodeのリスト(nodes)を作成
n = gets.to_i
n.times do
 no, na, *ns = gets.split.map(&:to_i)
 nodes[no] = { neighbors: ns }
end

#-- nodesを小さい方から調べて訪問してないならそれを支点としてDFSする
[*1...nodes.length].each do |i|
  if nodes[i][:visit] == nil
    stack.push i; stamp += 1; nodes[i][:visit] = stamp
    stack, nodes, stamp = dfs stack, nodes, stamp
  end
end

#-- 表示
[*1...nodes.length].each_with_index do |i|
  puts "#{i} #{nodes[i][:visit]} #{nodes[i][:fix]}"
end
