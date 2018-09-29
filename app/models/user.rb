class User < ActiveRecord::Base
  has_secure_password
  # validates_presence_of :username, :email, :password
  has_many :posts
  has_many :boards, through: :posts

  def slug
    username.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    User.all.find {|user| user.slug == slug }
  end
end
