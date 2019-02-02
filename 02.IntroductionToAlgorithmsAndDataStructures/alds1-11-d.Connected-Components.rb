#-- グループ分けされてない隣接ノード番号を返す
def next_neighbor nodes, x
  nodes[x][:neighbors].each do |neighbor|
    return neighbor if nodes[neighbor][:group_id] == nil
  end
  nil
end

#-- 深さ優先探索
#-- 再帰だとデータ量が多くなったときに耐えられないので変更
=begin
def dfs stack, nodes, group_id
  return nodes if stack == []

  x = stack.last
  neighbor = next_neighbor nodes, x
  if neighbor
    stack.push neighbor
    nodes[neighbor][:group_id] = group_id
  else
    stack.pop
  end

  dfs stack, nodes, group_id
end
=end

#-- メイン処理開始
n, m = gets.split.map(&:to_i)
nodes = Array.new(n) do {neighbors: []} end

#-- 隣接リストを格納
m.times do
  f_node, t_node = gets.split.map(&:to_i)
  nodes[f_node][:neighbors] << t_node
  nodes[t_node][:neighbors] << f_node
end

#-- グループ分けされていないノードに関してDFSする
group_id = 0; stack = []
nodes.each_with_index do |node, i|
  if node[:group_id] == nil
    stack.push i; group_id += 1
    while stack != []
      x = stack.last
      neighbor = next_neighbor nodes, x
      if neighbor
        stack.push neighbor
        nodes[neighbor][:group_id] = group_id
      else
        stack.pop
      end
    end
  end
end

#-- 判定して出力
c = gets.to_i
c.times do
  f_node, t_node = gets.split.map(&:to_i)
  f = nodes[f_node][:group_id]
  t = nodes[t_node][:group_id]

  if f == nil || t == nil || f != t then puts "no" else puts "yes" end
end
