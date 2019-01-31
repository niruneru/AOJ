#-- alds1-11-b :: DepthFirstSearch
#----------------------------------------------

#-- input : 訪問中のノード、隣接行列、発見時刻リスト
#-- output: 訪問中のノードに隣接しているが
#--         まだ発見されていないノード番号（見つからない場合はnil）
def search(x, matrix, ds)
    rc = nil
    matrix[x].each_with_index do |a, i|
        if a && ds[i] == nil
            rc = i
            break
        end
    end
    rc
end

ds = [] #-- 発見時刻(d:discovery)
fs = [] #-- 完了時刻(f:fixed)
tm = 0  #-- 現在時刻

#-- 隣接行列で格納
n = gets.chomp.to_i
matrix = Array.new(n) { [false] * n }
n.times do
    xs = gets.chomp.split.map(&:to_i)
    num = xs.shift; num -= 1; xs.shift
    xs.each { |x| matrix[num][x - 1] = true }
end

#-- 深さ探索用スタック
stack = []

#-- 探索
x = 0 #-- xは訪問中のノード
tm += 1; ds[x] = tm
stack << x

while stack != []
    x = stack.last #-- stack[-1]でも取れる
    y = search(x, matrix, ds) #-- xの次の隣接ノードを取得

    #-- 隣接ノードが見つからなかったらそのノードの探索完了
    if y == nil
        tm += 1; fs[x] = tm
        stack.pop
    #-- 見つかったならそれをスタックに積んで発見時刻を記録
    else
        stack << y
        tm += 1; ds[y] = tm
    end
end

[*0...n].each do |i|
  puts "#{i+1} #{ds[i]} #{fs[i]}"
end
