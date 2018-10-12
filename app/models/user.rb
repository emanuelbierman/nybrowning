class User < ActiveRecord::Base
  has_secure_password
  # validates_presence_of :username, :email, :password
  has_many :posts
  has_many :boards, through: :posts

  def self.print_all
    User.all.each do |user|
      print user.email + ", "
    end
  end
end
