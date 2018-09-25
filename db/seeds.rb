
user1 = User.create(username: "Robert Browning", email: "rb@rb.com", password_digest: "bells_and_pomegranates")
user2 = User.create(username: "Elizabeth Barrett Browning", email: "ebb@ebb.com", password_digest: "aurora_leigh")

5.times do |i|
  Post.create(content: "this is my content#{i}")
end

Board.create(topic: "Victorian Poetry")
Board.create(topic: "German Romanticism")

Post.all.each_with_index do |post, index|
  if index <= 3
    user = User.first
    post.user = user
    user.posts << post

    board = Board.find_by(topic: "Victorian Poetry")
    post.board = board
    board.posts << post
  else
    user = User.last
    post.user = user
    user.posts << post

    board = Board.find_by(topic: "German Romanticism")
    post.board = board
    board.posts << post
  end
end
