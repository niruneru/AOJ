#--  5
#--  1 2 3 4 5 <- preorder
#--  3 2 4 1 5 <- inorder
#--------------
#--> 3 4 2 5 1 <- postorder
#--------------
# preorderの先頭(h)を取って、inorder内の位置を検索
# 取得した位置の左がhの左部分木、右が右部分木
# それぞれをinorderとして再帰する。
# -----------------------------------------------
# rec(0, [1,2,3,4,5], [3,2,4,1,5])
#   rec(1, [3,2,4], [1,2,3,4,5]) -- return 4
#     rec(2, [3], [1,2,3,4,5]) -- return 3
#       rec(3, [], [1,2,3,4,5]) -- return 3
#       rec(3, [], [1,2,3,4,5]) -- return 3
#       print [1,2,3,4,5][2] // 3
#     rec(3, [4], [1,2,3,4,5]) -- return 4
#       rec(4, [], [1,2,3,4,5]) -- return 4
#       rec(4, [], [1,2,3,4,5]) -- return 4
#       print [1,2,3,4,5][3] // 4
#     print [1,2,3][1] // 2
#   rec(4, [5], [1,2,3,4,5]) -- return 5
#     rec(5, [], [1,2,3,4,5]) -- return 5
#     rec(5, [], [1,2,3,4,5]) -- return 5
#     print [1,2,3,4,5][4] // 5
#   print [1,2,3,4,5][0] // 1
#------------------------------------------------

gets
preorder = gets.chomp.split.map(&:to_i)
inorder = gets.chomp.split.map(&:to_i)
@postorder = []

def rec(n, inorder, preorder)
    if inorder != []
        c = preorder[n]; n += 1
        x = inorder.index(c)
        left = inorder[0...x]
        right = inorder[(x+1)..-1]
        n = rec(n, left, preorder)
        n = rec(n, right, preorder)
        @postorder << c
    end
    n
end

rec(0, inorder, preorder)
puts @postorder.join(' ')
