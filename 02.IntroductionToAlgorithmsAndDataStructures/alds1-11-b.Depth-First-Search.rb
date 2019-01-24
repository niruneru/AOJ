#-- DFS

def search(x, mtx, ds)
    rc = nil
    mtx[x].each_with_index { |a, i|
        if a && ds[x] != nil
            rc = i
            break
        end
    }
end
ds = [] #-- 発見時刻
fs = [] #-- 完了時刻
tm = 0  #-- 現在時刻

#-- 隣接行列で格納
mtx = []
row = []
n = gets.chomp.to_i
[*0...n].each { |i| row[i] = false }
[*0...n].each { |i| mtx[i] = row.clone }
n.times {
    xs = gets.chomp.split.map(&:to_i)
    num = xs.shift; num -= 1; xs.shift
    xs.each { |x| mtx[num][x - 1] = true }
}

#-- 深さ探索用スタック
stack = []

#-- 探索
x = 0 #-- xは訪問中のノード
tm += 1; ds[x] = tm
stack << x

while stack != []
    x = stack[-1]
    y = search(x, mtx, ds) #-- xの次の隣接ノードを取得

    p y

    if y == nil
        tm += 1; fs[x] = tm
        stack.pop
    else
        stack << y
        tm += 1; ds[y] = tm
    end
end

p ds
p fs
