# if you need to reset the ID's for a particular table, run this in rake console:
# ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = '<table_name>'")

user1 = User.create(username: "Robert Browning", email: "rb@rb.com", password: "sordello", password_confirmation: "sordello")
user2 = User.create(username: "Elizabeth Barrett Browning", email: "ebb@ebb.com", password: "aurora", password_confirmation: "aurora")

board1 = Board.create(topic: "Victorian Poetry")
board2 = Board.create(topic: "German Romanticism")

post1 = Post.create(id: 1, content: "Ah, but a man's reach should exceed his grasp, / Or what's a heaven for?")
post2 = Post.create(id: 2, content: "Who hears music, feels his solitude / Peopled at once")
post3 = Post.create(id: 3, content: "Best be yourself, imperial, plain, and true.")
post4 = Post.create(id: 4, content: "I show you doubt, to prove that faith exists.")
post5 = Post.create(id: 5, content: "Open my heart and you will see Graved inside of it, 'Italy'")

post1.user = user1
post2.user = user1
post3.user = user1
post4.user = user1
post5.user = user1

post1.board = board1
post2.board = board1
post3.board = board1
post4.board = board1
post5.board = board1

post6 = Post.create(id: 6, content: "How do I love thee? Let me count the ways. / I love thee to the depth and breadth and height / My soul can reach, when feeling out of sight / For the ends of Being and ideal Grace.")
post7 = Post.create(id: 7, content: "God answers sharp and sudden on some prayers, / And thrusts the thing we have prayed for in our face, / A gauntlet with a gift in't.")
post8 = Post.create(id: 8, content: "But love me for love's sake, that evermore / Thou may'st love on, through love's eternity.")
post9 = Post.create(id: 9, content: "'Guess now who holds thee?'—'Death,' I said. But there / The silver answer rang—'Not Death, but Love.'")
post10 = Post.create(id: 10, content: "Earth's crammed with heaven, And every common bush afire with God; And only he who sees takes off his shoes; The rest sit round it and pluck blackberries.")

post6.user = user2
post7.user = user2
post8.user = user2
post9.user = user2
post10.user = user2

post6.board = board2
post7.board = board2
post8.board = board2
post9.board = board2
post10.board = board2

#
# Post.find_by(id: 6).update(content: "How do I love thee? Let me count the ways. / I love thee to the depth and breadth and height / My soul can reach, when feeling out of sight / For the ends of Being and ideal Grace.")
# Post.find_by(id: 7).update(content: "God answers sharp and sudden on some prayers, / And thrusts the thing we have prayed for in our face, / A gauntlet with a gift in't.")
# Post.find_by(id: 8).update(content: "But love me for love's sake, that evermore / Thou may'st love on, through love's eternity.")
# Post.find_by(id: 9).update(content: "'Guess now who holds thee?'—'Death,' I said. But there / The silver answer rang—'Not Death, but Love.'")
# Post.find_by(id: 10).update(content: "Earth's crammed with heaven, And every common bush afire with God; And only he who sees takes off his shoes; The rest sit round it and pluck blackberries.")

# Post.find_by(id: 1).update(content: "Ah, but a man's reach should exceed his grasp, / Or what's a heaven for?")
# Post.find_by(id: 2).update(content: "Who hears music, feels his solitude / Peopled at once")
# Post.find_by(id: 3).update(content: "Best be yourself, imperial, plain, and true.")
# Post.find_by(id: 4).update(content: "I show you doubt, to prove that faith exists.")
# Post.find_by(id: 5).update(content: "Open my heart and you will see Graved inside of it, 'Italy'")
#
# 5.times do |i|
#   post = Post.create(content: "placeholder content")
#   post.user = User.last
#   User.last.posts << post
# end
#
# Post.find_by(id: 6).update(content: "How do I love thee? Let me count the ways. / I love thee to the depth and breadth and height / My soul can reach, when feeling out of sight / For the ends of Being and ideal Grace.")
# Post.find_by(id: 7).update(content: "God answers sharp and sudden on some prayers, / And thrusts the thing we have prayed for in our face, / A gauntlet with a gift in't.")
# Post.find_by(id: 8).update(content: "But love me for love's sake, that evermore / Thou may'st love on, through love's eternity.")
# Post.find_by(id: 9).update(content: "'Guess now who holds thee?'—'Death,' I said. But there / The silver answer rang—'Not Death, but Love.'")
# Post.find_by(id: 10).update(content: "Earth's crammed with heaven, And every common bush afire with God; And only he who sees takes off his shoes; The rest sit round it and pluck blackberries.")
#
# @board1 = Board.create(topic: "Victorian Poetry")
# @board2 = Board.create(topic: "German Romanticism")
#
# Post.all.each do |post|
#   if post.user == User.first
#     post.board = @board1
#     @board1.posts << post
#   elsif post.user == User.last
#     post.board = @board2
#     @board2.posts << post
#   end
# end
