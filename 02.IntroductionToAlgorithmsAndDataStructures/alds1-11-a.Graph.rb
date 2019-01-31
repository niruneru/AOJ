#-- ノードの数を取得
n = gets.chomp.to_i

#-- まずはゼロで埋める
#-- 最初はこう↓したけど
# row = []
# matrix = []
# [*0...n].each { |i| row[i] = 0 }
# [*0...n].each { |i| matrix[i] = row.clone }
#-- Array.newで配列を作る方法のほうが簡潔。これだとrowがブロックになって別オブジェクトになるので更新しても大丈夫。
#-- matrix = Array.new n { Array.new n, 0 }
#-- でも、これ↓に落ち着いた
matrix = Array.new(n) { [0] * n }

n.times do
    xs = gets.chomp.split.map(&:to_i)
    num = xs.shift; num -= 1; xs.shift
    xs.each { |x| matrix[num][x - 1] = 1 }
end

[*0...n].each do |i|
    if matrix[i] != nil
        puts matrix[i].join(' ')
    end
end
