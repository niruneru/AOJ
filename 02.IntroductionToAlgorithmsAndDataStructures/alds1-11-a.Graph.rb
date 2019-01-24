row = []
matrix = []

n = gets.chomp.to_i
[*0...n].each { |i| row[i] = 0 }
[*0...n].each { |i| matrix[i] = row.clone }
p matrix
n.times {
    xs = gets.chomp.split.map(&:to_i)
    num = xs.shift; num -= 1; xs.shift
    xs.each { |x| matrix[num][x - 1] = 1 }
}

[*0...n].each { |i|
    if matrix[i] != nil
        puts matrix[i].join(" ")
    end
}
