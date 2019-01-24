n, qt = gets.chomp.split.map(&:to_i)
pss = []
past = 0

n.times {
    ps, tm = gets.chomp.split
    tm = tm.to_i
    pss << [ps, tm]
}

while pss != []
    ps, tm = pss.shift
    if tm - qt <= 0
        past += tm
        puts "#{ps} #{past}"
    else
        past += qt
        tm -= qt
        pss << [ps, tm]
    end
end
