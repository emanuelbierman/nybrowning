class Email < ActiveRecord::Base
  validates_presence_of :email
  
  def self.print_all
    Email.all.each do |email|
      print email.email + ", "
    end
  end
end
