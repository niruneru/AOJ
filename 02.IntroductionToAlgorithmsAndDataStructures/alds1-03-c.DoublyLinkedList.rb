array = []

n = gets.chomp.to_i
n.times {
    s, x = gets.chomp.split()
    case s
    when "insert"
        array.unshift(x.to_i)
    when "delete"
        idx = array.find_index(x.to_i)
        array.delete_at(idx) if idx != nil
    when "deleteFirst"
        array.shift
    when "deleteLast"
        array.pop
    end
}

puts array.join(" ")
