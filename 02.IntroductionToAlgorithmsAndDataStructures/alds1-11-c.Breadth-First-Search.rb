#-- Breadth First Search
#-----------------------------------------------------

#-- matrix 
n = gets.to_i
matrix = Array.new(n) { [0] * n }

n.times do
    cols = gets.split.map(&:to_i)
    x = cols.shift; x -= 1; cols.shift
    cols.each { |col| matrix[x][col - 1] = 1 }
end


#-- 初期値設定
ds = [0] * n
vs = [false] * n; vs[0] = true
queue = [0]

while queue != []
    x = queue.shift
    matrix[x].each_with_index do |y, i|
        if y == 1 && vs[i] == false
            queue << i
            vs[i] = true
            ds[i] = ds[x] + 1
        end
    end
end

#-- 到達できないノードは-1に変更
[*1...ds.length].each do |i|
    ds[i] = -1 if ds[i] == 0
end

#-- 表示
ds.each_with_index do |d, i|
    puts "#{i+1} #{d}"
end
