class User < ActiveRecord::Base
  has_many :bweet
  validates_presence_of :name, :mail, :password_digest
  has_secure_password
end
