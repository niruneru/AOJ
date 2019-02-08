#-- alds1-12-b. Single-Source-Shortest-Path-1
#-- ダイクストラ法 : プリム法と同じ考え方でコストを累積して最短経路を求める
#-- 負の値の経路があると、正しくも求まらないので注意が必要
#-- alds1-11-aと違い入力は隣接リスト形式(ノード番号 隣接頂点数 [頂点番号 重み] ... )

n = gets.to_i

# 隣接行列の作成
INF = 100001 * n
graph = Array.new(n) { [INF] * n }
n.times do
  i, j, *vcs = gets.split.map(&:to_i)
  j.times do
    k = vcs.shift
    c = vcs.shift
    graph[i][k] = c
  end
end

# ダイクストラ
vs = [false] * n # <- verified
ws = [INF] * n   # <- weights

# 開始点を0とする
ws[0] = 0
mv  = -1

# 検証済のノードが無くなるまで実施
while vs.include? false
  min = INF
  mv  = -1

  # もっともコストが低く未検証のノード(minimum vertex)を探す
  ws.each_with_index do |w, i|
    if w < min && vs[i] == false
      min = w
      mv  = i
    end
  end

  # 見つけたらそれは最短経路に含めるので検証済みにする
  vs[mv] = true

  # 見つけたノードから到達可能なネイバーへのコストを調べる
  graph[mv].each_with_index do |cost, i|
    # ネイバーまでの現在のコストの方が大きいようなら更新する
    ws[i] = min + cost if ws[i] > min + cost && vs[i] == false
  end
end

ws.each_with_index { |cost, i| puts "#{i} #{cost}" }
