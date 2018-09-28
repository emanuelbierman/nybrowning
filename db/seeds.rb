# if you need to reset the ID's for a particular table, run this in rake console:
# ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = '<table_name>'")

user1 = User.create(username: "Robert Browning", email: "rb@rb.com", password: "sordello", password_confirmation: "sordello")
user2 = User.create(username: "Elizabeth Barrett Browning", email: "ebb@ebb.com", password: "aurora", password_confirmation: "aurora")

5.times do |i|
  post = Post.create(content: "placeholder content")
  post.user = User.first
  User.first.posts << post
end

Post.find_by(id: 1).update(content: "Ah, but a man's reach should exceed his grasp, / Or what's a heaven for?")
Post.find_by(id: 2).update(content: "Who hears music, feels his solitude / Peopled at once")
Post.find_by(id: 3).update(content: "Best be yourself, imperial, plain, and true.")
Post.find_by(id: 4).update(content: "I show you doubt, to prove that faith exists.")
Post.find_by(id: 5).update(content: "Open my heart and you will see Graved inside of it, 'Italy'")

5.times do |i|
  post = Post.create(content: "placeholder content")
  post.user = User.last
  User.last.posts << post
end

Post.find_by(id: 6).update(content: "How do I love thee? Let me count the ways. / I love thee to the depth and breadth and height / My soul can reach, when feeling out of sight / For the ends of Being and ideal Grace.")
Post.find_by(id: 7).update(content: "God answers sharp and sudden on some prayers, / And thrusts the thing we have prayed for in our face, / A gauntlet with a gift in't.")
Post.find_by(id: 8).update(content: "But love me for love's sake, that evermore / Thou may'st love on, through love's eternity.")
Post.find_by(id: 9).update(content: "'Guess now who holds thee?'—'Death,' I said. But there / The silver answer rang—'Not Death, but Love.'")
Post.find_by(id: 10).update(content: "Earth's crammed with heaven, And every common bush afire with God; And only he who sees takes off his shoes; The rest sit round it and pluck blackberries.")

@board1 = Board.create(topic: "Victorian Poetry")
@board2 = Board.create(topic: "German Romanticism")

Post.all.each do |post|
  if post.user == User.first
    post.board = @board1
    @board1.posts << post
  elsif post.user == User.last
    post.board = @board2
    @board2.posts << post
  end
end
