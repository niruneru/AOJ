pos     = [] #-- / が表れた位置を記憶するスタック
puddles = [] #-- 水溜りを記憶するスタック

cs = gets.chomp.chars

cs.each_with_index { |c, i|
    case c
    when '\\'
        pos << i
    when '/'
        #-- 今回の/に対応する\の位置をposから取得して、/の位置との差(面積)を求める。
        if pos != []
          p = pos.pop
          s = i - p

          #-- 今回の\の位置がすでに計算した水溜りの\の位置よりも左側なら統合すべき。
          while puddles != []
              bef = puddles[-1][0]
              while bef < p
                  s += puddle[-1][1]
                  puddle.pop
                  if puddle == []
                     break
                  else
                     bef = puddle[-1][0]
                  end
              end
          end

          puddle << [p, s]

        end
    end
}

p puddle
puts puddle.sum
print puddle.length
print " "
puts puddle.join(" ")
