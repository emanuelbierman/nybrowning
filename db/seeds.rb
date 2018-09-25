
user1 = User.new(username: "Robert Browning", email: "rb@rb.com", password: "sordello", password_confirmation: "sordello")
user2 = User.new(username: "Elizabeth Barrett Browning", email: "ebb@ebb.com", password: "aurora", password_confirmation: "aurora")
user1.save
user2.save

5.times do |i|
  post = Post.create(content: "this is his content#{i}")
  post.user = User.first
  User.first.posts << post
end

5.times do |i|
  post = Post.create(content: "this is her content#{i}")
  post.user = User.last
  User.last.posts << post
end

Board.create(topic: "Victorian Poetry")
Board.create(topic: "German Romanticism")

Post.all.each_with_index do |post, index|
  if index <= 4
    board = Board.find_by(topic: "Victorian Poetry")
    post.board = board
    board.posts << post
  else
    board = Board.find_by(topic: "German Romanticism")
    post.board = board
    board.posts << post
  end
end
