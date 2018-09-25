5.times do |i|
  User.create(username: "user#{i}", email: "email#{i}", password_digest: "pass#{i}")
end

5.times do |i|
  Post.create(content: "this is my content#{i}")
end

Board.create(topic: "Victorian Poetry")
Board.create(topic: "German Romanticism")

Post.all.each_with_index do |post, index|
  user = User.all.select {|user| user.id == post.id }
  post.user = user
  user.posts << post
  if index <= 3
    board = Board.find_by(topic: "Victorian Poetry")
    post.board = board
    board.posts << post
  else
    board = Board.find_by(topic: "German Romanticism")
    post.board = board
    board.posts << post
  end
end
