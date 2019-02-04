#-- alds1-12-a :: MinimumSpanningTree
INF = 2001

n = gets.to_i
graph = []       # Graph
ps = [nil] * n   # parents
ws = [INF] * n   # weights (input : 0 <= w <= 2000)
vs = [false] * n # validates (true : validated)

# create graph
n.times { graph << gets.split.map(&:to_i) }

# prim algorithm
while vs.include? false
  ps[0] = -1
  ws[0] = 0
  mv = -1
  minimum = INF

  # wsの中で未検証かつ最小の重みを持つノード(mv = minimum vertex)を見つける
  ws.each_with_index do |w, i|
    if (vs[i] == false) && (w < minimum)
      minimum = w
      mv = i
    end
  end

  # mvから未検証の隣接点までの重みを調べ、隣接点の現在の重み(wsの値)より小さいなら重みを更新する
  # その際、接続元のノード(psの値)も更新する
  graph[mv].each_with_index do |nw, i|
    if (vs[i] == false) && (nw != -1) && (nw < ws[i])
      ws[i] = nw
      ps[i] = mv
    end
  end

  # mvまでの最短は検証済にする
  vs[mv] = true
end

puts ws.sum
